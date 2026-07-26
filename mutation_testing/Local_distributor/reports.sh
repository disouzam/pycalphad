#!/bin/bash
directory="mutation_testing/Local_distributor"
uv run cr-report ${directory}/cosmic_ray.sqlite
echo $(date)