#!/usr/bin/env bash
directory="mutation_testing/10_workers"
uv run cr-report ${directory}/cosmic_ray.sqlite
echo $(date)