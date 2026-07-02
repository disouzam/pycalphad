#!/bin/bash
# From pycalphad root's folder, run this command:
directory="mutation_testing/Local_distributor"
uv run cosmic-ray --verbosity=DEBUG exec ${directory}/cosmic_ray.toml ${directory}/cosmic_ray.sqlite