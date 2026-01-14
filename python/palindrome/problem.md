# Valid Palindrome

**Difficulty:** Easy  
**Time:** 15 minutes  
**Language:** Python

## Problem Description

Determine if a given string is a palindrome, ignoring spaces, punctuation, and capitalization.

A palindrome reads the same forwards and backwards when considering only alphanumeric characters.

## Function Signature
```python
def is_palindrome(s: str) -> bool:
    """
    Determine if a string is a palindrome.
    
    Args:
        s: Input string
        
    Returns:
        True if palindrome, False otherwise
    """
    pass
```

## Requirements

- Only consider alphanumeric characters (letters and numbers)
- Case-insensitive comparison
- Return `True` or `False`
- Handle empty strings (return `True`)
- Handle single characters (return `True`)

## Examples
```python
is_palindrome("A man, a plan, a canal: Panama")
# Returns: True
# Explanation: "amanaplanacanalpanama" reads same forwards/backwards

is_palindrome("race a car")
# Returns: False
# Explanation: "raceacar" != "racaecar"

is_palindrome("Was it a car or a cat I saw?")
# Returns: True

is_palindrome("")
# Returns: True (empty string is palindrome)

is_palindrome("a")
# Returns: True

is_palindrome("ab")
# Returns: False
```

## Edge Cases to Consider

- Empty string
- Single character
- All punctuation/spaces (no alphanumeric)
- Mixed case letters
- Numbers mixed with letters
- Very long strings
- Only spaces
- Special characters: !@#$%^&*()
