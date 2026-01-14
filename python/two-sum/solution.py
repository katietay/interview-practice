def two_sum(nums: list[int], target: int) -> list[int]:

    seen = {}

    for i, num in enumerate(nums):
        complement = target - num

        if complement in seen:
            return [seen[complement], i]
        seen[num] = i


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
