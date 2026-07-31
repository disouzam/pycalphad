#!/usr/bin/env bash

function stop_distributor() {
    local distributor_pid="$1"
    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mStopping local distributor with PID: ${distributor_pid}...\e[0m"

        ps -p "${distributor_pid}"
        result=$?

        while [ $result -eq 0 ]; do
            kill -SIGTERM -- "-${distributor_pid}" 2>/dev/null || true
            kill -SIGKILL -- "-${distributor_pid}" 2>/dev/null || true
            kill -9 "${distributor_pid}" 2>/dev/null || true
            ps -p "${distributor_pid}"
            result=$?
            echo -e "\nChecking if distributor is still running - Return code: " $result
            sleep 5
        done

        read -r -a uv_process_row <<< "$(ps -f | grep uv | grep -v grep)"
        uv_pid="${uv_process_row[1]}"

        while [ -n "${uv_pid}" ]; do
            read -r -a uv_process_row <<< "$(ps -f | grep uv | grep -v grep)"
            uv_pid="${uv_process_row[1]}"
            if [ -n "${uv_pid}" ]; then
                kill -SIGTERM -- "-${uv_pid}" 2>/dev/null || true
                kill -SIGKILL -- "-${uv_pid}" 2>/dev/null || true
                kill -9 "${uv_pid}" 2>/dev/null || true
            fi
            echo -e "\nWaiting for uv to terminate - PID: ${uv_pid}"
            sleep 5
        done

        result=1
        while [ $result -ne 0 ]; do
            git restore "*.py"
            result=$?

            if [[ $result -ne 0 && -f ".git/index.lock" ]]; then
                rm -f '.git/index.lock'
            fi
            echo -e "\nRestoring git state (inside stop_distributor function) - Return code: " $result
            sleep 5
        done
    fi
}

function get_working_tree_status() {
    local file_extension="$1"

    result=1
    while [ $result -ne 0 ]; do
        status_filtered="<$(git status -uall --renames -s | grep ${file_extension} | head -n 1)>"
        result=$?
    done

    working_tree_status="${status_filtered:2:1}"
    echo $working_tree_status
}

current_pid=$(echo $$)
echo -e "\n\e[32mCurrent script PID: ${current_pid}\e[0m"

distributor_pid=""
result=1
while [ $result -ne 0 ]; do
    python_files_changed=$(git status -uall --renames -s | grep -E '.[[:alpha:]] .*\.py' | wc -l)
    result=$?
    echo -e "\nChecking for modified Python files before starting the distributor - Return code: " $result
done

while [ $python_files_changed -lt 2 ]; do

    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mLocal distributor is already running with PID: ${distributor_pid}.\e[0m"
    else
        result=1
        while [ $result -ne 0 ]; do
            git restore "*.py"
            result=$?
            echo -e "\nRestoring git state before starting the distributor - Return code: " $result
        done

        python_status=$(get_working_tree_status py)

        if [ "$python_status" != "" ]; then
            echo -e "\n\e[33mCan't start local distributor. There are uncommitted changes in the working tree.\e[0m"
            exit 4
        fi

        echo -e "\n\e[32mStarting local distributor...\e[0m"
        directory="mutation_testing/Local_distributor"
        uv run cosmic-ray --verbosity=DEBUG exec ${directory}/cosmic_ray.toml ${directory}/cosmic_ray.sqlite &
        distributor_pid=$!
        echo -e "\n\e[32mLocal distributor PID: ${distributor_pid}\e[0m"
    fi

    trap 'stop_distributor "${distributor_pid}"' SIGINT SIGTERM EXIT

    echo -e "\nLeave the monitor running locking the thread..."
    bash mutation_testing/check_status_periodically.sh "$1" --single-check

    monitor_rc=$?
    echo -e "\n\e[33mMonitor return code: ${monitor_rc}\e[0m"

    if [ $monitor_rc -eq 1 ]; then
        stop_distributor "${distributor_pid}"
        echo -e "\nWaiting for 5 seconds before restoring the git state...(at entry)"
        sleep 5

        result=1
        while [ $result -ne 0 ]; do
            git restore "*.py"
            result=$?
            echo -e "\nRestoring git state - Return code: " $result
        done

        echo -e "\n\n\e[31m#######################################################################"
        echo -e "\nMonitor return code 1"
        echo -e "\nMonitor detected no progress. Stopping the local distributor."

        result=1
        while [ $result -ne 0 ]; do
            python_files_changed=$(git status -uall --renames -s | grep -E '.[[:alpha:]] .*\.py' | wc -l)
            result=$?
            echo -e "\nChecking for modified Python files - Return code: " $result
        done

        if [ $python_files_changed -gt 0 ]; then
            echo -e "\nThere are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
        fi

        echo -e "#######################################################################\e[0m\n\n"
        distributor_pid=""
        trap - SIGINT SIGTERM EXIT
        printf '\a'
        echo -e "\nWaiting for 5 seconds before restoring the git state... (in the middle)"
        sleep 5

        result=1
        while [ $python_files_changed -gt 0 ]; do
            git restore "*.py"
            python_files_changed=$(git status -uall --renames -s | grep -E '.[[:alpha:]] .*\.py' | wc -l)
            echo -e "\nRestoring git state - Modified Python files remaining: " $python_files_changed
            sleep 5
        done

        if [ $python_files_changed -gt 0 ]; then
            echo -e "\n\n\e[31m#######################################################################"
            echo -e "\nThere are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
            echo -e "#######################################################################\e[0m\n\n"
            printf '\a'
            echo "Distributor PID: ${distributor_pid}"
            exit 1
        fi
    fi

    if [ $monitor_rc -eq 2 ]; then
        echo -e "\n\n\e[31m#######################################################################"
        echo -e "\nMonitor return code 2"
        echo -e "\nMonitor detected more than one modified Python file at a given time."
        echo -e "#######################################################################\e[0m\n\n"
        stop_distributor "${distributor_pid}"
        exit 2
    fi
done

if [ $python_files_changed -ge 2 ]; then
    echo -e "\n\n\e[31m#######################################################################"
    echo -e "\nLeft the main loop because there are more than 2 modified Python files."
    echo -e "\nMonitor detected more than one modified Python file at a given time."
    echo -e "#######################################################################\e[0m\n\n"
    exit 3
fi