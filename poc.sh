#!/bin/bash

function get_working_tree_status() {
    local file_extension="$1"
    status_filtered="<$(git status -s | grep ${file_extension} | head -n 1)>"
    working_tree_status="${status_filtered:2:1}"
    echo $working_tree_status
}

result_1=$(get_working_tree_status sqlite)
result_2=$(get_working_tree_status sh)

echo "\"$result_1\""
echo "\"$result_2\""