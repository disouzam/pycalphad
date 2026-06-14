"""Test session configuration and compatibility shims."""
from __future__ import annotations
import datetime


def pytest_configure(config):
    """Patch reporter/docutils compatibility for report template rendering.

    `pytest-reporter-html1` passes `writer="html5"` to docutils convenience
    functions, but newer docutils requires `writer_name="html5"`.
    """
    local_config = config
    now = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    report_name = local_config.option.report[0]
    prefix=report_name[:-5]
    extension = report_name[-5:]
    report_name_with_time_stamp = f"{prefix}_{now}{extension}"
    local_config.option.report[0] = report_name_with_time_stamp

    try:
        import pytest_reporter_html1.plugin as reporter_plugin
        from docutils.core import publish_parts as docutils_publish_parts
    except ImportError:
        return

    def _publish_parts_compat(*args, **kwargs):
        writer = kwargs.get("writer")
        if isinstance(writer, str) and "writer_name" not in kwargs:
            kwargs["writer_name"] = kwargs.pop("writer")
        return docutils_publish_parts(*args, **kwargs)

    return_value = _publish_parts_compat
    reporter_plugin.publish_parts = return_value