#!/bin/bash
directory="mutation_testing/Local_distributor"
uv run cr-report ${directory}/cosmic-ray-for-local-distributor.sqlite
echo $(date)