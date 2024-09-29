"""# rules_mypy

## Overview

Rules for the Python static type checker [mypy][mp]

### Setup

To setup the rules for `mypy`, define a [py_mypy_toolchain](#py_mypy_toolchain) within your
project and register it within your workspace. For example say you have the following `BUILD.bazel`
file in the root of your workspace:

```python
load("@rules_mypy//python/mypy:defs.bzl", "py_mypy_toolchain")

py_mypy_toolchain(
    name = "py_mypy_toolchain",
    mypy = "@pip_deps//:mypy",
)

toolchain(
    name = "toolchain",
    toolchain = ":py_mypy_toolchain",
    toolchain_type = "@rules_mypy//python/mypy:toolchain_type",
    visibility = ["//visibility:public"],
)
```

You would then add the following to your `WORKSPACE.bazel` file.

```python
register_toolchains("//tools/mypy:toolchain")
```

In addition to this formatter, a check can be added to your build phase using the [py_mypy_aspect](#py_mypy_aspect)
aspect. Simply add the following to a `.bazelrc` file to enable this check.

```text
build --aspects=@rules_mypy//python/mypy:defs.bzl%py_mypy_aspect
build --output_groups=+py_mypy_checks
```

These rules use a global flag to determine the location of the configuration file to use with mypy. To wire up a custom
config file, simply add the following to your `.bazelrc` file

```text
build --@rules_mypy//python/mypy:config=//:mypy.ini
```

Note the flag above assumes you have a `mpyp.ini` in the root of your repository.

It's recommended to only enable this aspect in your CI environment so formatting issues do not
impact user's ability to rapidly iterate on changes.


[mp]: https://mypy.readthedocs.io/

## Rules

- [current_py_mypy_toolchain](#current_py_mypy_toolchain)
- [py_mypy_aspect](#py_mypy_aspect)
- [py_mypy_test](#py_mypy_aspect)
- [py_mypy_toolchain](#py_mypy_toolchain)

---
---
"""

load(
    "//python/mypy/private:mypy.bzl",
    _py_mypy_aspect = "py_mypy_aspect",
    _py_mypy_test = "py_mypy_test",
)
load(
    "//python/mypy/private:mypy_toolchain.bzl",
    _py_mypy_toolchain = "py_mypy_toolchain",
)

py_mypy_aspect = _py_mypy_aspect
py_mypy_test = _py_mypy_test
py_mypy_toolchain = _py_mypy_toolchain
