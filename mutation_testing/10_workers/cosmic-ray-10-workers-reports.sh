#!/bin/bash
uv run cr-report mutation_testing/cosmic-ray-10-workers.sqlite
echo $(date)