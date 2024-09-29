"""Test module."""

from typing import Callable


def thrice(i: int, next_: Callable[[int], int]) -> int:
    """Call next three times."""
    return next_(next_(next_(i)))
