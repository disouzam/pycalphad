#!/usr/bin/env bash

NUM_WORKERS="$1"

if ! [[ "$NUM_WORKERS" =~ ^[1-9][0-9]*$ ]]; then
  echo "Usage: $0 <num_workers>"
  exit 1
fi

rm -rf worker*

for i in $(seq 1 "$NUM_WORKERS"); do
  worker_dir="worker${i}"
  mkdir "$worker_dir"
  find . -type f \
    ! -path "./.devcontainer/*" \
    ! -path "./.git/*" \
    ! -path "./.github/*" \
    ! -path "./.pytest_cache/*" \
    ! -path "./.venv/*" \
    ! -path "./.vscode/*" \
    ! -path "./__pycache__/*" \
    ! -path "./*/__pycache__/*" \
    ! -path "./automation/*" \
    ! -path "./docs/*" \
    ! -path "./examples/*" \
    ! -path "./mutation_testing/*" \
    ! -path "./pycalphad.egg-info/*" \
    ! -path "./tests/reports/*" \
    ! -path "./worker*/*" \
    -exec cp -v --parents {} "$worker_dir"/ \;
  pushd "$worker_dir"
  git add .
  sed -i 's|\.\./cosmic-ray|../../cosmic-ray|g' pyproject.toml
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYCALPHAD=0.11.2 uv sync
  port=$((9000 + i))
  launch_script="launch-worker-${i}.sh"
  echo "uv run cosmic-ray --verbosity DEBUG http-worker --port $port" >> $launch_script
  echo "popd" >> $launch_script
  popd
done