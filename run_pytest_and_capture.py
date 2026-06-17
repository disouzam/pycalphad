import io
import sys
import pytest
from datetime import datetime
from contextlib import redirect_stdout, redirect_stderr


def timestamp():
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")


class TimestampedWriter(io.StringIO):
    """
    A writer that timestamps every line written to it.
    """
    def write(self, text):
        # Split into lines while preserving newlines
        lines = text.splitlines(keepends=True)
        for line in lines:
            super().write(f"[{timestamp()}] {line}")
        return len(text)


def main():
    """
    Runs pytest programmatically, capturing the full terminal output
    with a timestamp on every line.

    Pytest automatically loads configuration from:
      - pyproject.toml
      - pytest.ini
      - setup.cfg
      - tox.ini
    including addopts and testpaths.
    """

    buffer = TimestampedWriter()

    # Pytest will still load addopts from pyproject.toml
    pytest_args = []

    with redirect_stdout(buffer), redirect_stderr(buffer):
        exit_code = pytest.main(pytest_args)

    # Save everything
    output = buffer.getvalue()
    with open("pytest_session_output.txt", "w", encoding="utf-8") as f:
        f.write(output)

    print(f"Pytest finished with exit code {exit_code}")
    print("Full timestamped session output saved to pytest_session_output.txt")


if __name__ == "__main__":
    main()
