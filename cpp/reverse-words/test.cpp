#include <string>
#include <cassert>
#include <iostream>

// Include your solution here or link it
std::string reverseWords(std::string s);

void testBasicCase()
{
    std::string result = reverseWords("the sky is blue");
    assert(result == "blue is sky the");
    std::cout << "Test: Basic case - PASS" << std::endl;
}

void testLeadingTrailingSpaces()
{
    std::string result = reverseWords("  hello world  ");
    assert(result == "world hello");
    std::cout << "Test: Leading/trailing spaces - PASS" << std::endl;
}

void testMultipleSpaces()
{
    std::string result = reverseWords("a good   example");
    assert(result == "example good a");
    std::cout << "Test: Multiple spaces - PASS" << std::endl;
}

void testSingleWord()
{
    std::string result = reverseWords("singleword");
    assert(result == "singleword");
    std::cout << "Test: Single word - PASS" << std::endl;
}

void testEmptyString()
{
    std::string result = reverseWords("");
    assert(result == "");
    std::cout << "Test: Empty string - PASS" << std::endl;
}

void testOnlySpaces()
{
    std::string result = reverseWords("    ");
    assert(result == "");
    std::cout << "Test: Only spaces - PASS" << std::endl;
}

void testTwoWords()
{
    std::string result = reverseWords("hello world");
    assert(result == "world hello");
    std::cout << "Test: Two words - PASS" << std::endl;
}

int main()
{
    testBasicCase();
    testLeadingTrailingSpaces();
    testMultipleSpaces();
    testSingleWord();
    testEmptyString();
    testOnlySpaces();
    testTwoWords();

    std::cout << "\nAll tests passed!" << std::endl;
    return 0;
}