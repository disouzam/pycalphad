#!/bin/bash
# From pycalphad root's folder, run this command:
directory="mutation_testing/Local_distributor"
uv run cosmic-ray exec ${directory}/cosmic-ray-local-distributor.toml ${directory}/cosmic-ray-for-local-distributor.sqlite