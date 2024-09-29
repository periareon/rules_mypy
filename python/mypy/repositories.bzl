"""rules_mypy dependencies"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# buildifier: disable=unnamed-macro
def rules_mypy_dependencies():
    """Defines mypy dependencies"""
    maybe(
        http_archive,
        name = "rules_venv",
        integrity = "sha256-bpCnHTsR9hFUovuLcaccSV8xXshOvd+XAF6XvTTyTxc=",
        urls = ["https://github.com/periareon/rules_venv/releases/download/0.0.3/rules_venv-0.0.3.tar.gz"],
    )

# buildifier: disable=unnamed-macro
def register_mypy_toolchains(register_toolchains = True):
    """Defines pytest dependencies"""
    if register_toolchains:
        native.register_toolchains(
            str(Label("//python/mypy/toolchain")),
        )
