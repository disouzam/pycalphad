#!/bin/bash
directory="mutation_testing/02_workers"
uv run cr-report ${directory}/cosmic-ray-02-workers.sqlite
echo $(date)
