# Reverse Words in String

**Difficulty:** Medium  
**Time:** 15 minutes  
**Language:** C++

## Problem Description

Given a string, reverse the order of words while preserving spaces between them. A word is defined as a sequence of non-space characters.

## Function Signature
```cpp
#include <string>

std::string reverseWords(std::string s);
```

## Requirements

- Reverse word order, not individual characters within words
- Preserve single spaces between words
- Remove leading and trailing spaces
- Reduce multiple consecutive spaces to a single space
- Return the modified string

## Examples
```cpp
reverseWords("the sky is blue")
// Returns: "blue is sky the"

reverseWords("  hello world  ")
// Returns: "world hello"

reverseWords("a good   example")
// Returns: "example good a"
// Note: multiple spaces reduced to one

reverseWords("singleword")
// Returns: "singleword"
```

## Edge Cases to Consider

- Single word
- Empty string
- Only spaces
- Leading/trailing spaces
- Multiple consecutive spaces
- Special characters as part of words
- String with one character
