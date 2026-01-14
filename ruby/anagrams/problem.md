# Group Anagrams

**Difficulty:** Medium  
**Time:** 15 minutes  
**Language:** Ruby

## Problem Description

Given an array of strings, group anagrams together. Anagrams are words with the same letters in different orders.

## Function Signature
```ruby
def group_anagrams(words)
  # Returns array of arrays
end
```

## Requirements

- Return array of arrays (each sub-array is a group of anagrams)
- Order of groups doesn't matter
- Order within groups doesn't matter
- Case-sensitive ("Eat" and "eat" are different)
- Empty strings are valid (group with other empty strings)

## Examples
```ruby
group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
# Returns: [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
# (order may vary)

group_anagrams(["a"])
# Returns: [["a"]]

group_anagrams([""])
# Returns: [[""]]

group_anagrams(["listen", "silent", "enlist"])
# Returns: [["listen", "silent", "enlist"]]

group_anagrams([])
# Returns: []
```

## Edge Cases to Consider

- Empty array
- Array with one word
- Empty strings in array
- All words are anagrams of each other
- No anagrams (all words are unique)
- Words of different lengths (cannot be anagrams)
- Case-sensitive handling

