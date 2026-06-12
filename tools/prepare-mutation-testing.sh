#!/bin/bash

rm -rf worker1 worker2
mkdir worker1
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
  ! -path "./worker1/*" \
  ! -path "./worker2/*" \
  -exec cp -v --parents {} worker1/ \;
pushd worker1
git add .
sed -i 's|\.\./cosmic-ray|../../cosmic-ray|g' pyproject.toml
SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYCALPHAD=0.11.2 uv sync
popd

mkdir worker2
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
  ! -path "./worker1/*" \
  ! -path "./worker2/*" \
  -exec cp -v --parents {} worker2/ \;
pushd worker2
git add .
sed -i 's|\.\./cosmic-ray|../../cosmic-ray|g' pyproject.toml
SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYCALPHAD=0.11.2 uv sync
popd