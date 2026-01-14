#include <string>
#include <iostream>
#include <algorithm>

std::string reverseWords(std::string s)
{
    std::vector<std::string> words;

    std::string current_word = "";

    for (int i = 0; i < s.length(); i++)
    {
        if (s[i] != ' ')
        {
            current_word += s[i];
        }
        else
        {
            if (current_word.length() > 0)
            {
                words.push_back(current_word);
            }
            current_word = "";
        }
    }
    if (current_word.length() > 0)
    {
        words.push_back(current_word);
    }
    std::reverse(words.begin(), words.end());

    std::string result = "";

    for (int i = 0; i < words.size(); i++)
    {
        result += words[i];
        if (i < words.size() - 1)
        {
            result += ' ';
        }
    }
    return result;
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