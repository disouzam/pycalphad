#!/bin/bash
# From pycalphad root's folder, run this command:
# bash mutation_testing/prepare-worker-folders.sh 10
# Then, open 10 terminals and run the custom script in each worker folder:
# cd worker1 && bash launch-worker-1.sh
# cd worker2 && bash launch-worker-2.sh and so on...
# In a separate terminal, run current script to execute the mutation testing:
uv run cosmic-ray exec mutation_testing/cosmic-ray-10-workers.toml mutation_testing/cosmic-ray-10-workers.sqlite