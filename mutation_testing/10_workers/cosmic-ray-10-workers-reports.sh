#!/bin/bash
directory="mutation_testing/10_workers"
uv run cr-report ${directory}/cosmic-ray-10-workers.sqlite
echo $(date)