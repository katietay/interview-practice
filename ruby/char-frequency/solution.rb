def character_frequencies(words)
  result ={}

  words.each do |word|
    freq = {}
    word.downcase.chars.each do |char|
      if char =~/[a-z]/
        freq[char] ||= 0
        freq[char] += 1
      end

    end
    result[word] = freq

  end
  return result

end
  
# Test your solution
if __FILE__ == $PROGRAM_NAME
  # Test cases
  test1 = character_frequencies(["hello", "world"])
  puts "Test 1:"
  puts test1.inspect
  puts "Expected: {\"hello\"=>{\"h\"=>1, \"e\"=>1, \"l\"=>2, \"o\"=>1}, \"world\"=>{\"w\"=>1, \"o\"=>1, \"r\"=>1, \"l\"=>1, \"d\"=>1}}"
  puts
  
  test2 = character_frequencies(["AAA", "BbB"])
  puts "Test 2:"
  puts test2.inspect
  puts "Expected: {\"AAA\"=>{\"a\"=>3}, \"BbB\"=>{\"b\"=>3}}"
  puts
  
  test3 = character_frequencies(["Hi There!"])
  puts "Test 3:"
  puts test3.inspect
  puts "Expected: {\"Hi There!\"=>{\"h\"=>2, \"i\"=>1, \"t\"=>1, \"e\"=>2, \"r\"=>1}}"
  puts
  
  test4 = character_frequencies([])
  puts "Test 4:"
  puts test4.inspect
  puts "Expected: {}"
  puts
end