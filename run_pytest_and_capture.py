import io
import sys
from contextlib import redirect_stdout, redirect_stderr
from pathlib import Path
from datetime import datetime
import pytest
import tomllib


def timestamp():
    return datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

def load_pytest_ini_options():
    """
    Reads [tool.pytest.ini_options] from pyproject.toml
    and returns it as a dict.
    """
    pyproject = Path("pyproject.toml")
    if not pyproject.exists():
        return {}

    with pyproject.open("rb") as f:
        data = tomllib.load(f)

    return (
        data
        .get("tool", {})
        .get("pytest", {})
        .get("ini_options", {})
    )

# This object will receive pytest's config
class ConfigCapturePlugin:
    def __init__(self):
        self.config = None

    def pytest_configure(self, config):
        # pytest has fully loaded config here
        self.config = config

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
    plugin = ConfigCapturePlugin()

    # Load pytest ini_options from pyproject.toml
    # ini_options = load_pytest_ini_options()

    # Show what we loaded
    # print("Loaded pytest ini_options from pyproject.toml:")
    # for key, value in ini_options.items():
    #     print(f"  {key} = {value}")

    # Pytest will still load addopts from pyproject.toml

    # Treat command-line args passed to this script as pytest args
    pytest_args = sys.argv[1:]

    start_timestamp = timestamp()
    pytest_args.append(f"--start-timestamp={start_timestamp}")

    # Write start timestamp
    buffer.write(f"=== Pytest session started at {start_timestamp} ===\n")

    with redirect_stdout(buffer), redirect_stderr(buffer):
        exit_code = pytest.main(pytest_args, plugins=[plugin])

    # Write end timestamp
    buffer.write(f"=== Pytest session ended at {timestamp()} ===\n")
    buffer.write(f"Exit code: {exit_code}\n")

    # Save everything
    config = plugin.config
    job_id = config.getoption("--job-id")
    output = buffer.getvalue()

    if job_id is None:
        file_name = f"pytest_session_output_{start_timestamp}.txt"
    else:
        file_name = f"pytest_session_output_{job_id}_{start_timestamp}.txt"
    with open(file_name, "w", encoding="utf-8") as f:
        f.write(output)

    print(f"Pytest finished with exit code {exit_code}")
    print(f"Full session output saved to {file_name}")
    sys.exit(exit_code)


if __name__ == "__main__":
    main()
