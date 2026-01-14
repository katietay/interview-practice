# Character Frequency Counter

**Difficulty:** Medium  
**Time:** 15 minutes  
**Language:** Ruby

## Problem Description

Given an array of strings, return a hash where keys are strings and values are hashes mapping each character to its frequency count (case-insensitive, ignore spaces and non-alphabetic characters).

## Function Signature
```ruby
def character_frequencies(words)
  # Returns hash of hashes
end
```

## Requirements

- Count only alphabetic characters (a-z, A-Z)
- Case-insensitive (treat 'A' and 'a' as the same)
- Ignore spaces, punctuation, and special characters
- Return hash where:
  - Keys are original strings (unchanged)
  - Values are hashes mapping lowercase characters to counts

## Examples
```ruby
character_frequencies(["hello", "world"])
# Returns: {
#   "hello" => {"h"=>1, "e"=>1, "l"=>2, "o"=>1},
#   "world" => {"w"=>1, "o"=>1, "r"=>1, "l"=>1, "d"=>1}
# }

character_frequencies(["AAA", "BbB"])
# Returns: {
#   "AAA" => {"a"=>3},
#   "BbB" => {"b"=>3}
# }

character_frequencies(["Hi There!"])
# Returns: {
#   "Hi There!" => {"h"=>2, "i"=>1, "t"=>1, "e"=>2, "r"=>1}
# }
# Note: space and ! ignored, case-insensitive

character_frequencies([])
# Returns: {}
```

## Edge Cases to Consider

- Empty array
- Empty strings in array
- Strings with only spaces/punctuation
- Single character strings
- Duplicate words in input array
- Nil input
- Numbers in strings (should be ignored)

## Approach Ideas
```ruby
def character_frequencies(words)
  result = {}
  
  words.each do |word|
    freq = Hash.new(0)
    
    word.downcase.chars.each do |char|
      freq[char] += 1 if char =~ /[a-z]/
    end
    
    result[word] = freq
  end
  
  result
end
```

**Time Complexity:** O(n * m) where n is number of words, m is average word length  
**Space Complexity:** O(n * k) where k is number of unique characters

## Testing Your Solution

Run the test file to verify your solution handles all cases correctly.