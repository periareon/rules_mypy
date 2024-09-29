"""A test to demonstrate mypy is able to import py.typed markers from other targets"""

import unittest

from python.mypy.private.tests.imports.importable import thrice


def add(i: int) -> int:
    """Add 1 to i"""
    return i + 1


class UnitTests(unittest.TestCase):
    """Unit tests"""

    def test_thrice(self) -> None:
        """Use an external function to force mypy to process it."""
        self.assertEqual(thrice(3, add), 6)


if __name__ == "__main__":
    unittest.main()
