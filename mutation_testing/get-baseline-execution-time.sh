#!/usr/bin/env bash

start_time=$(date +%s)

uv run python -m pytest tests --template=html1/index.html --report=report.html -s

end_time=$(date +%s)
elapsed=$((end_time - start_time))
echo "Execution time: ${elapsed} seconds"