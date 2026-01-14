#include <vector>
#include <algorithm>
#include <iostream>

struct Item
{
    int price;
    int rating;
};

bool compare(Item a, Item b)
{
    if (a.price != b.price)
    {
        return a.price < b.price;
    }
    else
    {
        return a.rating > b.rating;
    }
}

std::vector<Item> sortItems(std::vector<Item> items)
{

    std::sort(items.begin(), items.end(), compare);
    return items;
}

// Helper function to print items
void printItems(const std::vector<Item> &items)
{
    std::cout << "[";
    for (size_t i = 0; i < items.size(); ++i)
    {
        std::cout << "{price: " << items[i].price << ", rating: " << items[i].rating << "}";
        if (i < items.size() - 1)
            std::cout << ", ";
    }
    std::cout << "]" << std::endl;
}

int main()
{
    // Test cases
    std::vector<Item> test1 = {{10, 9}, {3, 8}, {5, 3}, {10, 2}};
    std::cout << "Test 1 Input:  ";
    printItems(test1);
    std::vector<Item> result1 = sortItems(test1);
    std::cout << "Test 1 Output: ";
    printItems(result1);
    std::cout << std::endl;

    std::vector<Item> test2 = {{20, 1}, {15, 9}, {15, 2}};
    std::cout << "Test 2 Input:  ";
    printItems(test2);
    std::vector<Item> result2 = sortItems(test2);
    std::cout << "Test 2 Output: ";
    printItems(result2);
    std::cout << std::endl;

    std::vector<Item> test3 = {};
    std::cout << "Test 3 Input:  ";
    printItems(test3);
    std::vector<Item> result3 = sortItems(test3);
    std::cout << "Test 3 Output: ";
    printItems(result3);

    return 0;
}