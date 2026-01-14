require_relative 'solution'

def test_basic_case
  result = character_frequencies(["hello", "world"])
  expected = {
    "hello" => {"h"=>1, "e"=>1, "l"=>2, "o"=>1},
    "world" => {"w"=>1, "o"=>1, "r"=>1, "l"=>1, "d"=>1}
  }
  assert_equal(expected, result, "Basic case")
end

def test_case_insensitive
  result = character_frequencies(["AAA", "BbB"])
  expected = {
    "AAA" => {"a"=>3},
    "BbB" => {"b"=>3}
  }
  assert_equal(expected, result, "Case insensitive")
end

def test_ignore_special_chars
  result = character_frequencies(["Hi There!"])
  expected = {
    "Hi There!" => {"h"=>2, "i"=>1, "t"=>1, "e"=>2, "r"=>1}
  }
  assert_equal(expected, result, "Ignore special characters")
end

def test_empty_array
  result = character_frequencies([])
  expected = {}
  assert_equal(expected, result, "Empty array")
end

def test_empty_string
  result = character_frequencies([""])
  expected = {"" => {}}
  assert_equal(expected, result, "Empty string")
end

def test_only_special_chars
  result = character_frequencies(["!!!"])
  expected = {"!!!" => {}}
  assert_equal(expected, result, "Only special characters")
end

def test_with_numbers
  result = character_frequencies(["abc123"])
  expected = {"abc123" => {"a"=>1, "b"=>1, "c"=>1}}
  assert_equal(expected, result, "With numbers (should be ignored)")
end

def assert_equal(expected, actual, test_name)
  if expected == actual
    puts "PASS: #{test_name}"
  else
    puts "FAIL: #{test_name}"
    puts "  Expected: #{expected.inspect}"
    puts "  Got: #{actual.inspect}"
  end
end

# Run tests
test_basic_case
test_case_insensitive
test_ignore_special_chars
test_empty_array
test_empty_string
test_only_special_chars
test_with_numbers

puts "\nAll tests completed!"