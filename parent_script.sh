#!/bin/bash

bash child_script_1.sh &
pid1=$!
echo "Child script 1 started with PID $pid1"

bash child_script_2.sh &
pid2=$!
echo "Child script 2 started with PID $pid2"

wait $pid1

sleep 10

echo "Stopping child script 1..."
kill $pid1

sleep 10

echo "Stopping child script 2..."
kill $pid2