#!/bin/bash

python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
while [ $python_files_changed -lt 2 ]; do
    echo "Waiting for at least 2 modified Python files. Currently, there are ${python_files_changed} modified Python files."
    python_files_changed=$(git st | grep -E 'modified:.*\.py' | wc -l)
    sleep 1
done