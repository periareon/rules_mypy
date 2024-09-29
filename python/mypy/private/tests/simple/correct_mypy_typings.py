"""A test to show mypy is able to correctly parse type annotations"""

# isort: off
# Remove the sys.path entry that allows Python to escape the bazel sandbox.
# https://github.com/bazelbuild/bazel/issues/7091
import sys

if sys.version_info[:2] < (3, 11):
    del sys.path[0]
# isort: on

import unittest
from typing import Callable


def twice(i: int, next_: Callable[[int], int]) -> int:
    """Invoke a callback 3 times."""
    return next_(next_(i))


def add(i: int) -> int:
    """Add 1 to a value."""
    return i + 1


class UnitTests(unittest.TestCase):
    """Unit tests"""

    def test_twice(self) -> None:
        """A use of `thrice` for mypy to parse."""
        self.assertEqual(twice(3, add), 5)


if __name__ == "__main__":
    unittest.main()
