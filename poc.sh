#!/usr/bin/env bash

function get_children() {
    local parent_pid="$1"
    local children_str="$2"
    local parents_str="$3"
    local -a children=()
    local -a parents=()


    IFS=',' read -r -a children <<< "$children_str"
    IFS=',' read -r -a parents <<< "$parents_str"
    children_from_parent=()
    for key in "${!children[@]}"; do
        if [ "${parents[$key]}" == "$parent_pid" ]; then
            children_from_parent+=("${children[$key]}")
        fi
    done

    echo "${children_from_parent[@]}"
}

function get_parent_chain() {
    local parent_pid="$1"
    local parent_child_string_map_as_str="$2"

    next_parent="$parent_pid"

    IFS=',' read -r -a parent_child_string_map <<< "$parent_child_string_map_as_str"

    parent_chain=""

    while [[ -n "$next_parent" ]]; do
        found_parent=false
        for entry in "${parent_child_string_map[@]}"; do
            entry_parent="${entry%>*}"
            entry_child="${entry#*>}"
            if [ "$entry_parent" == "$next_parent" ]; then
                parent_chain+="${entry_child}>"
                found_parent=true
                next_parent=${entry_child}
                break
            fi
        done
        if [ "$found_parent" = false ]; then
            next_parent=""
        fi
    done

    echo "${parent_chain%>}"
}

function get_active_processes() {
    mapfile -t -s 1 active_processes < <(echo $(ps -f))
    echo "${active_processes[@]}"
}

function get_child_process() {
    local active_processes=$1

    child_processes=()

    for process in "${active_processes[@]}"; do
        process_parts=()
        read -r -a process_parts <<< "${process}"

        pid=${process_parts[1]}
        child_processes+=("${pid}")
    done

    echo "${child_processes[@]}"
}

function get_parent_process() {
    local active_processes=$1

    parent_processes=()

    for process in "${active_processes[@]}"; do
        process_parts=()
        read -r -a process_parts <<< "${process}"

        ppid=${process_parts[2]}
        parent_processes+=("${ppid}")
    done

    echo "${parent_processes[@]}"
}

function get_parent_chain_as_a_string() {
    local active_processes=$1

    child_processes=$(get_child_process "$active_processes")
    parent_processes=$(get_parent_process "$active_processes")

    visited_parents=()

    child_process_string=$(IFS=','; echo "${child_processes[*]}")
    parent_process_string=$(IFS=','; echo "${parent_processes[*]}")

    parent_child_string_map=()
    for parent in "${parent_processes[@]}"; do
        visited=false
        for visited_parent in "${visited_parents[@]}"; do
            if [ "$parent" == "$visited_parent" ]; then
                visited=true
                break
            fi
        done

        if [ "$visited" = true ]; then
            continue
        fi
        visited_parents+=("$parent")

        childrens=$(get_children "$parent" "$child_process_string" "$parent_process_string")
        for child in $childrens; do
            parent_child_string_map+=("${parent}>${child}")
        done
    done

    parent_child_string_map_as_str=$(IFS=','; echo "${parent_child_string_map[*]}")

    echo ${parent_child_string_map_as_str}
}

visited_parents=()

active_processes=$(get_active_processes)

echo -e "\n\e[32mActive processes:\e[0m"
echo "$active_processes[@]"

parent_child_string_map_as_str=$(get_parent_chain_as_a_string "$active_processes")

parent_processes=($(get_parent_process "$active_processes"))

for parent in "${parent_processes[@]}"; do
    visited=false
    for visited_parent in "${visited_parents[@]}"; do
        if [ "$parent" == "$visited_parent" ]; then
            visited=true
            break
        fi
    done

    if [ "$visited" = true ]; then
        continue
    fi
    visited_parents+=("$parent")
    echo "Visiting parent PID: ${parent}"
    echo -n "${parent}>"

    parent_chain=$(get_parent_chain "$parent" "$parent_child_string_map_as_str")
    echo -n "$parent_chain"

    echo -e "\n"
done