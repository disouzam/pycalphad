#!/bin/bash

# This script checks the status of mutation testing at a configurable interval (default: 90 seconds).
interval_seconds="90"
single_check="false"
for arg in "$@"; do
    if [[ "$arg" == "--single-check" ]]; then
        single_check="true"
    elif [[ "$arg" =~ ^[0-9]+$ ]] && [[ "$arg" -gt 0 ]]; then
        interval_seconds="$arg"
    else
        echo "Usage: $0 [interval_seconds] [--single-check]"
        exit 1
    fi
done


prev_complete=""
stopped_at=""
current_interval="$interval_seconds"
while true; do
    raw_output="$(bash mutation_testing/Local_distributor/reports.sh 2>&1)"
    echo -e "\n================================================================"
    status_output="$(echo "$raw_output" | tail -n 4)"
    current_complete="$(echo "$status_output" | grep -E '^complete:' | sed -E 's/^complete:[[:space:]]*([0-9]+).*/\1/')"
    status_output_colorized="$(echo "$status_output" | sed -E 's/^(complete:.*)$/\x1b[35m\1\x1b[0m/')"
    echo -e "$status_output_colorized"

    if [[ -n "$prev_complete" && -n "$current_complete" && "$current_complete" == "$prev_complete" ]]; then
        if [[ -z "$stopped_at" ]]; then
            stopped_at="$(date '+%Y-%m-%d %H:%M:%S')"

            if [[ "$single_check" == "true" ]]; then
                printf '\a'
                exit 1
            fi
        fi
        printf '\a'
        current_interval=$((current_interval / 2))
        if [[ "$current_interval" -lt 1 ]]; then
            echo -e "\e[31mInterval has reached the minimum of 1s. Resetting to default interval of ${interval_seconds}s.\e[0m"
            current_interval=$interval_seconds
        fi
        echo -e "\e[31mReducing interval to \e[0m${current_interval}s \e[33m(stopped at: ${stopped_at})\e[0m"
    else
        stopped_at=""
        current_interval="$interval_seconds"
    fi
    echo -e "\n$(git add "*.lock" && git add "*.sqlite" && git add "report*.html" && git add "pytest*.txt" && git add "*.sh" && git st | tail -n10 | grep modified:)\n"
    git dw
    echo -e "\nCurrent interval: ${current_interval}s (default: ${interval_seconds}s)"
    for ((i=current_interval; i>0; i--)); do
        python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
        if [[ "$python_files_changed" -gt 1 ]]; then
            echo -e "\n\n\e[31m#######################################################################"
            echo "There are ${python_files_changed} modified Python files. Mutation testing can't proceed. Stopping this launcher"
            echo -e "#######################################################################\e[0m\n\n"
            printf '\a'
            exit 2
        fi

        if [[ "$single_check" == "true" && "$prev_complete" != "" ]]; then
            echo -e "Next check in \e[33m${i}\e[0m seconds... Mutants checked: \e[33m${current_complete}\e[0m / Previous number of mutants checked: \e[33m${prev_complete}\e[0m"
        elif [[ "$single_check" == "true" && "$prev_complete" == "" ]]; then
            echo -e "Next check in \e[33m${i}\e[0m seconds... Mutants checked: \e[33m${current_complete}\e[0m"
        else
            printf "\rNext check in %3d seconds..." "$i"
        fi
        sleep 1
    done
    if [[ "$prev_complete" != "" && "$single_check" == "true" ]]; then
        exit 0
    fi
    prev_complete="$current_complete"
    echo
done