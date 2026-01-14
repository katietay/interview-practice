import unittest
from solution import two_sum


class TestTwoSum(unittest.TestCase):

    def test_basic_case(self):
        result = two_sum([2, 7, 11, 15], 9)
        self.assertEqual(set(result), {0, 1})

    def test_middle_elements(self):
        result = two_sum([3, 2, 4], 6)
        self.assertEqual(set(result), {1, 2})

    def test_duplicate_values(self):
        result = two_sum([3, 3], 6)
        self.assertEqual(set(result), {0, 1})

    def test_negative_numbers(self):
        result = two_sum([-1, -2, -3, -4, -5], -8)
        self.assertIsNotNone(result)
        self.assertEqual(len(result), 2)

    def test_target_zero(self):
        result = two_sum([-3, 2, 3, -2], 0)
        self.assertIsNotNone(result)
        self.assertEqual(len(result), 2)

    def test_large_numbers(self):
        result = two_sum([1000000, 2000000, 3000000], 5000000)
        self.assertEqual(set(result), {1, 2})


if __name__ == "__main__":
    unittest.main()
