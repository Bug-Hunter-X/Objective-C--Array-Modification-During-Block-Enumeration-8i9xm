# Objective-C: Array Modification During Block Enumeration

This repository demonstrates a common bug in Objective-C related to modifying an array while iterating using a block.  The bug causes crashes or data corruption due to index shifting.  The solution provides a safe alternative using array copying.

## Bug
The `bug.m` file shows the problematic code that modifies an array (`dataArray`) during enumeration within a block.  This leads to unexpected behavior because the iteration indices are invalidated by the removal of objects.

## Solution
The `bugSolution.m` file presents the solution, creating a mutable copy of the `dataArray` before iterating and modifying the copy. This keeps the original array intact, preventing index issues and crashes.