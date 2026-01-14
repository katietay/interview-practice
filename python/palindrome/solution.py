def is_palindrome(s: str) -> bool:
    cleaned = ""
    for char in s:
        if char.isalnum():
            cleaned += char.lower()

    return cleaned[::-1] == cleaned


# Test your solution
if __name__ == "__main__":
    # Test cases
    test_cases = [
        ("A man, a plan, a canal: Panama", True),
        ("race a car", False),
        ("Was it a car or a cat I saw?", True),
        ("", True),
        ("a", True),
        ("ab", False),
    ]

    for s, expected in test_cases:
        result = is_palindrome(s)
        status = "PASS" if result == expected else "FAIL"
        print(f"{status}: is_palindrome('{s}') = {result} (expected {expected})")
