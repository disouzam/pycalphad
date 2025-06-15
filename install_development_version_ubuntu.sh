#!/bin/bash
set -o xtrace
PS4='${LINENO}: '

# Uncomment the following lines to clone the repository if you haven't already
# git clone https://github.com/pycalphad/pycalphad.git
# cd pycalphad

# It is assumed that you are in the root directory of the pycalphad repository.
if [ ! -f requirements-dev.txt ]; then
    echo "Error: requirements-dev.txt not found. Please run this script from the root directory of the pycalphad repository."
    exit 1
fi

# Create a virtual environment and install the development version of pycalphad
if [ -d .venv ]; then
    echo "Warning: .venv directory already exists. Reusing existing virtual environment."
else
    echo "Creating a new virtual environment in .venv"
    python3 -m venv .venv
    echo "*" > .venv/.gitignore
fi

# Activate the virtual environment and install dependencies
source .venv/Scripts/activate

python3 -m pip install -U pip setuptools
python3 -m pip install -U -r requirements-dev.txt
python3 -m pip install -U --no-build-isolation --editable .


set +o xtrace