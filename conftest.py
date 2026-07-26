"""Test session configuration and compatibility shims."""

from __future__ import annotations


def pytest_configure(config):
    """Patch reporter/docutils compatibility for report template rendering.

    `pytest-reporter-html1` passes `writer="html5"` to docutils convenience
    functions, but newer docutils requires `writer_name="html5"`.
    """
    _ = config

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

    reporter_plugin.publish_parts = _publish_parts_compat