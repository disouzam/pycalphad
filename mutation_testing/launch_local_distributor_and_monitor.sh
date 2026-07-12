#!/bin/bash

cleanup() {
    local distributor_pid="$1"
    local monitor_pid="$2"
    kill "${distributor_pid}" "${monitor_pid}" 2>/dev/null
    exit 1
}

distributor_pid=""
while true; do

    if [[ -n "${distributor_pid}" ]]; then
        echo "Local distributor is already running with PID: ${distributor_pid}."
    else
        source mutation_testing/Local_distributor/launch.sh &
        distributor_pid=$!
        echo "Local distributor PID: ${distributor_pid}"
    fi

    source mutation_testing/check_status_periodically.sh "$1" --single-check &
    monitor_pid=$!
    echo "Monitor PID: ${monitor_pid}"

    trap 'cleanup "${distributor_pid}" "${monitor_pid}"' INT TERM EXIT

    wait "${monitor_pid}"
    monitor_rc=$?
    echo "Monitor return code: ${monitor_rc}"

    if [ "${monitor_rc}" -eq 1 ]; then
        echo -e "\n#######################################################################"
        echo "Monitor detected no progress. Stopping the local distributor."
        echo -e "\n#######################################################################"
        kill "${distributor_pid}" 2>/dev/null
        distributor_pid=""
        trap - INT TERM EXIT
        printf '\a'
        git restore "*.py"
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)

        if [[ "${python_files_changed}" -gt 0 ]]; then
            echo -e "\n#######################################################################"
            echo "There are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
            echo -e "\n#######################################################################"
            exit 1
        fi
    fi
done

