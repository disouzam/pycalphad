#!/bin/bash

function stop_distributor() {
    local distributor_pid="$1"
    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mStopping local distributor with PID: ${distributor_pid}...\e[0m"
        kill -SIGTERM -- "-${distributor_pid}" 2>/dev/null || true
        kill -SIGKILL -- "-${distributor_pid}" 2>/dev/null || true
        wait "${distributor_pid}" 2>/dev/null || true
    fi
}

function stop_monitor() {
    local monitor_pid="$1"
    if [ -n "${monitor_pid}" ]; then
        echo -e "\n\e[33mStopping monitor with PID: ${monitor_pid}...\e[0m"
        kill -SIGTERM -- "-${monitor_pid}" 2>/dev/null || true
        kill -SIGKILL -- "-${monitor_pid}" 2>/dev/null || true
        wait "${monitor_pid}" 2>/dev/null || true
    fi
}

function cleanup() {
    local distributor_pid="$1"
    local monitor_pid="$2"
    echo -e "\n\e[33mCleaning up...\e[0m"
    stop_distributor "${distributor_pid}"
    stop_monitor "${monitor_pid}"
    exit 1
}

distributor_pid=""
python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
while [ $python_files_changed -lt 2 ]; do

    if [ -n "${distributor_pid}" ]; then
        echo -e "\n\e[33mLocal distributor is already running with PID: ${distributor_pid}.\e[0m"
    else
        echo -e "\n\e[32mStarting local distributor...\e[0m"
        bash mutation_testing/Local_distributor/launch.sh &
        distributor_pid=$!
        echo -e "\n\e[32mLocal distributor PID: ${distributor_pid}\e[0m"
    fi

    bash mutation_testing/check_status_periodically.sh "$1" --single-check &
    monitor_pid=$!
    echo -e "\n\e[32mMonitor PID: ${monitor_pid}\e[0m"

    trap 'cleanup "${distributor_pid}" "${monitor_pid}"' SIGINT SIGTERM EXIT

    wait "${monitor_pid}"
    monitor_rc=$?
    echo -e "\n\e[33mMonitor return code: ${monitor_rc}\e[0m"

    if [ $monitor_rc -eq 1 ]; then
        stop_distributor "${distributor_pid}"
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
        git restore .
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)

        if [ $python_files_changed -gt 0 ]; then
            echo -e "\n\n\e[31m#######################################################################"
            echo -e "\nThere are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
            echo -e "#######################################################################\e[0m\n\n"
            printf '\a'
            echo "Distributor PID: ${distributor_pid}"
            echo "Monitor PID: ${monitor_pid}"
            exit 1
        fi
    fi

    if [ $monitor_rc -eq 2 ]; then
        echo -e "\n\n\e[31m#######################################################################"
        echo -e "\nMonitor return code 2"
        echo -e "\nMonitor detected more than one modified Python file at a given time."
        echo -e "#######################################################################\e[0m\n\n"
        stop_distributor "${distributor_pid}"
        exit 1
    fi
done

if [ $python_files_changed -ge 2 ]; then
    echo -e "\n\n\e[31m#######################################################################"
    echo -e "\nLeft the main loop because there are more than 2 modified Python files."
    echo -e "\nMonitor detected more than one modified Python file at a given time."
    echo -e "#######################################################################\e[0m\n\n"
    exit 1
fi