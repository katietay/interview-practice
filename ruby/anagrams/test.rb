require_relative 'solution'

def normalize_groups(groups)
  # Sort groups and items within groups for comparison
  groups.map { |group| group.sort }.sort
end

def test_basic_anagrams
  result = group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
  expected = [["ate", "eat", "tea"], ["bat"], ["nat", "tan"]]
  
  if normalize_groups(result) == normalize_groups(expected)
    puts "PASS: Basic anagrams"
  else
    puts "FAIL: Basic anagrams"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{result.inspect}"
  end
end

def test_single_word
  result = group_anagrams(["a"])
  expected = [["a"]]
  
  if normalize_groups(result) == normalize_groups(expected)
    puts "PASS: Single word"
  else
    puts "FAIL: Single word"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{result.inspect}"
  end
end

def test_empty_string
  result = group_anagrams([""])
  expected = [[""]]
  
  if normalize_groups(result) == normalize_groups(expected)
    puts "PASS: Empty string"
  else
    puts "FAIL: Empty string"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{result.inspect}"
  end
end

def test_all_anagrams
  result = group_anagrams(["listen", "silent", "enlist"])
  expected = [["listen", "silent", "enlist"]]
  
  if normalize_groups(result) == normalize_groups(expected)
    puts "PASS: All anagrams"
  else
    puts "FAIL: All anagrams"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{result.inspect}"
  end
end

def test_empty_array
  result = group_anagrams([])
  expected = []
  
  if result == expected
    puts "PASS: Empty array"
  else
    puts "FAIL: Empty array"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{result.inspect}"
  end
end

def test_no_anagrams
  result = group_anagrams(["abc", "def", "ghi"])
  expected = [["abc"], ["def"], ["ghi"]]
  
  if normalize_groups(result) == normalize_groups(expected)
    puts "PASS: No anagrams"
  else
    puts "FAIL: No anagrams"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{result.inspect}"
  end
end

def test_case_sensitive
  result = group_anagrams(["Eat", "eat", "Tea"])
  # "Eat" and "eat" are different due to case
  # All three should be in separate groups since they're case-sensitive
  
  # Count number of groups
  if result.length == 3
    puts "PASS: Case sensitive"
  else
    puts "FAIL: Case sensitive (should have 3 separate groups)"
    puts "  Got: #{result.inspect}"
  end
end

# Run tests
test_basic_anagrams
test_single_word
test_empty_string
test_all_anagrams
test_empty_array
test_no_anagrams
test_case_sensitive

puts "\nAll tests completed!"