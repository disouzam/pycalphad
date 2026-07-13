#!/usr/bin/env bash

# Usage: ./poc-2.sh <PID>

list_direct_children() {
	local ppid="$1"

	if command -v pgrep >/dev/null 2>&1; then
		pgrep -P "$ppid" 2>/dev/null || true
	else
		ps -eo pid=,ppid= 2>/dev/null | awk -v p="$ppid" '$2==p {print $1}'
	fi
}

get_all_children() {
	local root_pid="$1"
	local -a queue children
	local current child

	queue=("$root_pid")

	while ((${#queue[@]})); do
		current="${queue[0]}"
		queue=("${queue[@]:1}")

		while IFS= read -r child; do
			child="${child//[[:space:]]/}"
			[[ -z "$child" ]] && continue
			children+=("$child")
			queue+=("$child")
		done < <(list_direct_children "$current")
	done

	ALL_CHILDREN=("${children[@]}")
}

if [[ -z "$1" || ! "$1" =~ ^[0-9]+$ ]]; then
	echo "Usage: $0 <PID>"
	exit 1
fi

if ! kill -0 "$1" 2>/dev/null; then
	echo "PID not found: $1"
	exit 1
fi

declare -a ALL_CHILDREN
get_all_children "$1"

printf '%s\n' "${ALL_CHILDREN[@]}"
