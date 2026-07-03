#!/bin/bash

# This script checks the status of mutation testing at a configurable interval (default: 90 seconds).
interval_seconds="${1:-90}"
if ! [[ "$interval_seconds" =~ ^[0-9]+$ ]] || [[ "$interval_seconds" -le 0 ]]; then
	echo "Usage: $0 [interval_seconds]"
	exit 1
fi

prev_complete=""
stopped_at=""
current_interval="$interval_seconds"
while true; do
	raw_output="$(bash mutation_testing/Local_distributor/reports.sh 2>&1)"
	status_output="$(echo "$raw_output" | tail -n 4)"
	echo -e "\n$status_output"

	current_complete="$(echo "$status_output" | grep -E '^complete:' | sed -E 's/^complete:[[:space:]]*([0-9]+).*/\1/')"
	if [[ -n "$prev_complete" && -n "$current_complete" && "$current_complete" == "$prev_complete" ]]; then
		if [[ -z "$stopped_at" ]]; then
			stopped_at="$(date '+%Y-%m-%d %H:%M:%S')"
		fi
		printf '\a'
		current_interval=$((current_interval / 2))
		if [[ "$current_interval" -lt 1 ]]; then
			current_interval=1
		fi
		echo -e "\e[31mReducing interval to \e[0m${current_interval}s \e[33m(stopped at: ${stopped_at})\e[0m"
	else
		stopped_at=""
		current_interval="$interval_seconds"
	fi
	prev_complete="$current_complete"
	for ((i=current_interval; i>0; i--)); do
		printf "\rNext check in %3ds..." "$i"
		sleep 1
	done
	echo
done