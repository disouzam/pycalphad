#!/bin/bash

echo -e "\n\e[32mStarting the script POC-3.sh...\e[0m"

raw_process=$(echo $(ps -f))

echo -e "\n\e[32mRaw process:\e[0m"
echo "$raw_process"

mapfile -t -s 1 active_processes < <(echo "$raw_process")
echo "${active_processes[@]}"