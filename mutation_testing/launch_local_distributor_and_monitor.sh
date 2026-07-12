#!/bin/bash

cleanup() {
    local distributor_pid="$1"
    local monitor_pid="$2"
    kill "${distributor_pid}" "${monitor_pid}" 2>/dev/null
    exit 1
}

distributor_pid=""
python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
while [ $python_files_changed -lt 2 ]; do

    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mLocal distributor is already running with PID: ${distributor_pid}.\e[0m"
    else
        echo -e "\n\e[33mStarting local distributor...\e[0m"
        bash mutation_testing/Local_distributor/launch.sh &
        distributor_pid=$!
        echo -e "\nLocal distributor PID: ${distributor_pid}"
    fi

    bash mutation_testing/check_status_periodically.sh "$1" --single-check &
    monitor_pid=$!
    echo -e "\nMonitor PID: ${monitor_pid}"

    trap 'cleanup "${distributor_pid}" "${monitor_pid}"' INT TERM EXIT

    wait "${monitor_pid}"
    monitor_rc=$?
    echo -e "\nMonitor return code: ${monitor_rc}"

    if [ $monitor_rc -eq 1 ]; then
        kill "${distributor_pid}" 2>/dev/null
        git restore .
        echo -e "\n\n\e[31m#######################################################################"
        echo "Monitor detected no progress. Stopping the local distributor."
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
        if [ $python_files_changed -gt 0 ]; then
            echo "There are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
        fi
        echo "There are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
        echo -e "#######################################################################\e[0m\n\n"
        distributor_pid=""
        trap - INT TERM EXIT
        printf '\a'
        git restore .
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)

        if [ $python_files_changed -gt 0 ]; then
            echo -e "\n\n\e[31m#######################################################################"
            echo "There are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
            echo -e "#######################################################################\e[0m\n\n"
            printf '\a'
            exit 1
        fi
    fi

    if [ $monitor_rc -eq 2 ]; then
        echo -e "\n\n\e[31m#######################################################################"
        echo "Monitor detected more than one modified Python file at a given time."
        echo -e "#######################################################################\e[0m\n\n"
        kill "${distributor_pid}" 2>/dev/null
        exit 1
    fi
done

if [ $python_files_changed -lt 2 ]; then
    echo -e "\n\n\e[31m#######################################################################"
    echo "Monitor detected more than one modified Python file at a given time."
    echo -e "#######################################################################\e[0m\n\n"
    exit 1
fi