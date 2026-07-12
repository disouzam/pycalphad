#!/bin/bash

bash mutation_testing/Local_distributor/launch.sh
bash mutation_testing/check_status_periodically.sh "$1"