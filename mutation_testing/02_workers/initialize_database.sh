#!/usr/bin/env bash
# Initialization

force_argument=$1

mutation_testing_dir="mutation_testing"
directory="${mutation_testing_dir}/02_workers"

database_path="${directory}/cosmic_ray.sqlite"
config_path="${mutation_testing_dir}/cosmic-ray-base-config.toml"

if [ -n "$force_argument" ] && [ "$force_argument" != "--force" ]; then
    echo "Usage: $0 [--force]"
    exit 1
fi
if [ -f "$database_path" ] && [ "$force_argument" != "--force" ]; then
    echo "Database \"$database_path\" already exists. Use --force to overwrite."
    exit 1
fi

echo -e "\nInitializing database for 2 workers...\n"
if [ -n "$force_argument" ] && [ "$force_argument" == "--force" ]; then
    uv run cosmic-ray init "$config_path" "$database_path" --force
else
    uv run cosmic-ray init "$config_path" "$database_path"
fi

# Baseline execution
echo -e "\nRunning baseline execution...\n"
uv run cosmic-ray --verbosity=CRITICAL baseline "$config_path"
