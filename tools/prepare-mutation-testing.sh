#!/bin/bash

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
    ! -path "./*/__pycache__/*" \
    ! -path "./automation/*" \
    ! -path "./docs/*" \
    ! -path "./examples/*" \
    ! -path "./tests/reports/*" \
    ! -path "./worker*/*" \
    -exec cp -v --parents {} "$worker_dir"/ \;
  pushd "$worker_dir"
  git add .
  sed -i 's|\.\./cosmic-ray|../../cosmic-ray|g' pyproject.toml
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYCALPHAD=0.11.2 uv sync
  port=$((9000 + i))
  echo "uv run cosmic-ray --verbosity INFO http-worker --port $port" > launch-worker-"$i".sh
  popd
done