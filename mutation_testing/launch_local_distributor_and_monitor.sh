#!/bin/bash

cleanup() {
    local distributor_pid="$1"
    local monitor_pid="$2"
    kill "${distributor_pid}" "${monitor_pid}" 2>/dev/null
}

while true; do
    bash mutation_testing/Local_distributor/launch.sh &
    distributor_pid=$!
    echo "Local distributor PID: ${distributor_pid}"

    bash mutation_testing/check_status_periodically.sh "$1" &
    monitor_pid=$!
    echo "Monitor PID: ${monitor_pid}"

    trap 'cleanup "${distributor_pid}" "${monitor_pid}"' INT TERM EXIT

    wait "${monitor_pid}"
    monitor_rc=$?
    echo "Monitor return code: ${monitor_rc}"

    if [ "${monitor_rc}" -eq 1 ]; then
        kill "${distributor_pid}" 2>/dev/null
    fi
done

