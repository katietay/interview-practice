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

## Approach Ideas

**Option 1: Split, Reverse, Join**
1. Split string into words (ignoring spaces)
2. Reverse the vector of words
3. Join with single spaces
- Time: O(n), Space: O(n)

**Option 2: In-place (Advanced)**
1. Reverse entire string
2. Reverse each word individually
3. Handle spaces carefully
- Time: O(n), Space: O(1)

**Recommended:** Use Option 1 for clarity and correctness.

## Testing Your Solution

Compile and run the test file to verify your solution handles all cases correctly.