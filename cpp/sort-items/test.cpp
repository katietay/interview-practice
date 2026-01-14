#include <vector>
#include <algorithm>
#include <cassert>
#include <iostream>

struct Item
{
    int price;
    int rating;
};

// Include your solution here or link it
std::vector<Item> sortItems(std::vector<Item> items);

bool itemsEqual(const std::vector<Item> &a, const std::vector<Item> &b)
{
    if (a.size() != b.size())
        return false;
    for (size_t i = 0; i < a.size(); ++i)
    {
        if (a[i].price != b[i].price || a[i].rating != b[i].rating)
        {
            return false;
        }
    }
    return true;
}

void testBasicSort()
{
    std::vector<Item> input = {{10, 5}, {10, 8}, {5, 3}};
    std::vector<Item> expected = {{5, 3}, {10, 8}, {10, 5}};
    std::vector<Item> result = sortItems(input);
    assert(itemsEqual(result, expected));
    std::cout << "Test: Basic sort - PASS" << std::endl;
}

void testSamePriceDifferentRating()
{
    std::vector<Item> input = {{20, 1}, {15, 9}, {15, 2}};
    std::vector<Item> expected = {{15, 9}, {15, 2}, {20, 1}};
    std::vector<Item> result = sortItems(input);
    assert(itemsEqual(result, expected));
    std::cout << "Test: Same price, different rating - PASS" << std::endl;
}

void testEmptyVector()
{
    std::vector<Item> input = {};
    std::vector<Item> expected = {};
    std::vector<Item> result = sortItems(input);
    assert(itemsEqual(result, expected));
    std::cout << "Test: Empty vector - PASS" << std::endl;
}

void testSingleItem()
{
    std::vector<Item> input = {{10, 5}};
    std::vector<Item> expected = {{10, 5}};
    std::vector<Item> result = sortItems(input);
    assert(itemsEqual(result, expected));
    std::cout << "Test: Single item - PASS" << std::endl;
}

void testAllSamePrice()
{
    std::vector<Item> input = {{10, 3}, {10, 9}, {10, 5}};
    std::vector<Item> expected = {{10, 9}, {10, 5}, {10, 3}};
    std::vector<Item> result = sortItems(input);
    assert(itemsEqual(result, expected));
    std::cout << "Test: All same price - PASS" << std::endl;
}

int main()
{
    testBasicSort();
    testSamePriceDifferentRating();
    testEmptyVector();
    testSingleItem();
    testAllSamePrice();

    std::cout << "\nAll tests passed!" << std::endl;
    return 0;
}