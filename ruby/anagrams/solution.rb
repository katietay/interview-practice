def group_anagrams(words)
  groups = {}

    words.each do |word|
      key = word.chars.sort.join
      groups[key] ||= []
      groups[key] << word

    end

    return groups.values

end

# Test your solution
if __FILE__ == $PROGRAM_NAME
  # Test cases
  test1 = group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
  puts "Test 1:"
  puts test1.inspect
  puts "Expected: [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']] (order may vary)"
  puts
  
  test2 = group_anagrams(["a"])
  puts "Test 2:"
  puts test2.inspect
  puts "Expected: [['a']]"
  puts
  
  test3 = group_anagrams([""])
  puts "Test 3:"
  puts test3.inspect
  puts "Expected: [['']]"
  puts
  
  test4 = group_anagrams(["listen", "silent", "enlist"])
  puts "Test 4:"
  puts test4.inspect
  puts "Expected: [['listen', 'silent', 'enlist']] (order may vary)"
  puts
  
  test5 = group_anagrams([])
  puts "Test 5:"
  puts test5.inspect
  puts "Expected: []"
  puts
end