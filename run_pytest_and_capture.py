import io
import sys
import pytest
from datetime import datetime
from contextlib import redirect_stdout, redirect_stderr


def timestamp():
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")


def main():
    """
    Runs pytest programmatically, capturing the full terminal output
    (session header, collection info, warnings, failures, summary)
    and writing it to pytest_session_output.txt with timestamps.

    Pytest automatically loads configuration from:
      - pyproject.toml
      - pytest.ini
      - setup.cfg
      - tox.ini
    including addopts and testpaths.
    """

    buffer = io.StringIO()

    # Pytest will still load addopts from pyproject.toml
    pytest_args = []

    # Write start timestamp
    buffer.write(f"=== Pytest session started at {timestamp()} ===\n\n")

    with redirect_stdout(buffer), redirect_stderr(buffer):
        exit_code = pytest.main(pytest_args)

    # Write end timestamp
    buffer.write(f"\n=== Pytest session ended at {timestamp()} ===\n")
    buffer.write(f"Exit code: {exit_code}\n")

    # Save everything
    output = buffer.getvalue()
    with open("pytest_session_output.txt", "w", encoding="utf-8") as f:
        f.write(output)

    print(f"Pytest finished with exit code {exit_code}")
    print("Full session output saved to pytest_session_output.txt")


if __name__ == "__main__":
    main()
