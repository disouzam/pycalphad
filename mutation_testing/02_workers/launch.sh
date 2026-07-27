#!/usr/bin/env bash
# From pycalphad root's folder, run this command:
# bash mutation_testing/prepare-worker-folders.sh 2
# Then, open 2 terminals and run the custom script in each worker folder:
# cd worker1 && bash launch-worker-1.sh
# cd worker2 && bash launch-worker-2.sh
# In a separate terminal, run current script to execute the mutation testing:
directory="mutation_testing/02_workers"
uv run cosmic-ray exec ${directory}/cosmic_ray.toml ${directory}/cosmic_ray.sqlite