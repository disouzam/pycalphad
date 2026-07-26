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
popd