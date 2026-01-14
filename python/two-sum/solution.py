def two_sum(nums: list[int], target: int) -> list[int]:
    """
    Find indices of two numbers that add up to target.

    Args:
        nums: List of integers
        target: Target sum

    Returns:
        List of two indices [index1, index2]
    """
    # Your solution here
    pass


# Test your solution
if __name__ == "__main__":
    # Test cases
    test_cases = [
        ([2, 7, 11, 15], 9, [0, 1]),
        ([3, 2, 4], 6, [1, 2]),
        ([3, 3], 6, [0, 1]),
    ]

    for nums, target, expected in test_cases:
        result = two_sum(nums, target)
        # Check if result matches (order doesn't matter)
        is_correct = set(result) == set(expected)
        status = "PASS" if is_correct else "FAIL"
        print(f"{status}: two_sum({nums}, {target}) = {result} (expected {expected})")
