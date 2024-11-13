"""rules_mypy dependencies"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# buildifier: disable=unnamed-macro
def rules_mypy_dependencies():
    """Defines mypy dependencies"""
    maybe(
        http_archive,
        name = "rules_venv",
        integrity = "sha256-Hb6raL/eMeTEkfbAbM2mBtoua4bcwBr5FwhvGrAMjow=",
        urls = ["https://github.com/periareon/rules_venv/releases/download/0.0.7/rules_venv-0.0.7.tar.gz"],
    )

# buildifier: disable=unnamed-macro
def register_mypy_toolchains(register_toolchains = True):
    """Defines pytest dependencies"""
    if register_toolchains:
        native.register_toolchains(
            str(Label("//python/mypy/toolchain")),
        )
