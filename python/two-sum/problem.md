# Two Sum

**Difficulty:** Easy  
**Time:** 15 minutes  
**Language:** Python

## Problem Description

Given an array of integers and a target sum, return the indices of two numbers that add up to the target.

You may assume that each input has exactly one solution, and you cannot use the same element twice.

## Function Signature
```python
def two_sum(nums: list[int], target: int) -> list[int]:
    """
    Find indices of two numbers that add up to target.
    
    Args:
        nums: List of integers
        target: Target sum
        
    Returns:
        List of two indices [index1, index2]
    """
    pass
```

## Requirements

- Return array of two indices [index1, index2]
- Indices can be in any order
- Cannot use the same element twice
- Assume exactly one solution exists
- Return the first valid pair found

## Examples
```python
two_sum([2, 7, 11, 15], 9)
# Returns: [0, 1]
# Explanation: nums[0] + nums[1] = 2 + 7 = 9

two_sum([3, 2, 4], 6)
# Returns: [1, 2]
# Explanation: nums[1] + nums[2] = 2 + 4 = 6

two_sum([3, 3], 6)
# Returns: [0, 1]
# Explanation: nums[0] + nums[1] = 3 + 3 = 6
```

## Edge Cases to Consider

- Array with exactly 2 elements
- Negative numbers in array
- Negative target
- Target is 0
- Large numbers
- Duplicate values in array
- First and last element sum to target

