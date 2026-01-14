#include <string>
#include <iostream>

std::string reverseWords(std::string s)
{
    // Your solution here

    return s;
}

int main()
{
    // Test cases
    std::cout << "Test 1: \"" << reverseWords("the sky is blue") << "\"" << std::endl;
    std::cout << "Expected: \"blue is sky the\"" << std::endl
              << std::endl;

    std::cout << "Test 2: \"" << reverseWords("  hello world  ") << "\"" << std::endl;
    std::cout << "Expected: \"world hello\"" << std::endl
              << std::endl;

    std::cout << "Test 3: \"" << reverseWords("a good   example") << "\"" << std::endl;
    std::cout << "Expected: \"example good a\"" << std::endl
              << std::endl;

    std::cout << "Test 4: \"" << reverseWords("singleword") << "\"" << std::endl;
    std::cout << "Expected: \"singleword\"" << std::endl
              << std::endl;

    std::cout << "Test 5: \"" << reverseWords("") << "\"" << std::endl;
    std::cout << "Expected: \"\"" << std::endl
              << std::endl;

    return 0;
}