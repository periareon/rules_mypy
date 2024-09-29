"""Demonstrate mypy can validate imports from repo absolute paths."""

from python.mypy.private.tests.repo_absolute_imports.types_example import (
    FooEnumType,
    SeqOfMaybeInts,
)

blah: SeqOfMaybeInts = [1, None, 2, None, 3, 4, 5]
blurgh: FooEnumType = FooEnumType.BAR
