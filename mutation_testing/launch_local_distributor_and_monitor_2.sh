#!/usr/bin/env bash

function stop_distributor() {
    local distributor_pid="$1"
    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mStopping local distributor with PID: ${distributor_pid}...\e[0m"
        kill -SIGTERM -- "-${distributor_pid}" 2>/dev/null || true
        sleep 3
        kill -SIGKILL -- "-${distributor_pid}" 2>/dev/null || true
        sleep 3
        kill -9 "${distributor_pid}" 2>/dev/null || true
        sleep 3
        wait "${distributor_pid}" 2>/dev/null || true
        git restore .
        sleep 3
        git restore .
        rm -rf '.git/index.lock'
        git restore .
        sleep 3
    fi
}

function stop_monitor() {
    local monitor_pid="$1"
    if [ -n "${monitor_pid}" ]; then
        echo -e "\n\e[33mStopping monitor with PID: ${monitor_pid}...\e[0m"
        kill -SIGTERM -- "-${monitor_pid}" 2>/dev/null || true
        sleep 3
        kill -SIGKILL -- "-${monitor_pid}" 2>/dev/null || true
        sleep 3
        kill -9 "${monitor_pid}" 2>/dev/null || true
        sleep 3
        wait "${monitor_pid}" 2>/dev/null || true
    fi
}


function get_working_tree_status() {
    local file_extension="$1"
    status_filtered="<$(git status -s | grep ${file_extension} | head -n 1)>"
    working_tree_status="${status_filtered:2:1}"
    echo $working_tree_status
}

current_pid=$(echo $$)
echo -e "\n\e[32mCurrent script PID: ${current_pid}\e[0m"

distributor_pid=""
python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
while [ $python_files_changed -lt 2 ]; do

    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mLocal distributor is already running with PID: ${distributor_pid}.\e[0m"
    else
        git restore .
        sqlite_status=$(get_working_tree_status sqlite)
        python_status=$(get_working_tree_status py)

        if [ "$sqlite_status" != "" ] || [ "$python_status" != "" ]; then
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
        echo -e "Waiting for 5 seconds before restoring the git state...(at entry)"
        sleep 5
        git restore .
        echo -e "\n\n\e[31m#######################################################################"
        echo -e "\nMonitor return code 1"
        echo -e "\nMonitor detected no progress. Stopping the local distributor."
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)

        if [ $python_files_changed -gt 0 ]; then
            echo -e "\nThere are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
        fi

        echo -e "#######################################################################\e[0m\n\n"
        distributor_pid=""
        trap - SIGINT SIGTERM EXIT
        printf '\a'
        echo -e "Waiting for 5 seconds before restoring the git state... (in the middle)"
        sleep 5
        git restore .
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)

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