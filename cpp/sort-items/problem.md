# Sort with Custom Comparator

**Difficulty:** Medium  
**Time:** 15 minutes  
**Language:** C++

## Problem Description

Given a vector of items (each with a price and rating), sort them by price ascending. If two items have the same price, sort by rating descending (higher rating first).

## Function Signature
```cpp
#include <vector>

struct Item {
    int price;
    int rating;
};

std::vector<Item> sortItems(std::vector<Item> items);
```

## Requirements

- Primary sort: price (low to high)
- Secondary sort: rating (high to low) - for items with same price
- Return new sorted vector (don't modify original)
- Handle empty vector
- Use std::sort with custom comparator

## Examples
```cpp
Input: [{price: 10, rating: 5}, {price: 10, rating: 8}, {price: 5, rating: 3}]
Output: [{price: 5, rating: 3}, {price: 10, rating: 8}, {price: 10, rating: 5}]

Input: [{price: 20, rating: 1}, {price: 15, rating: 9}, {price: 15, rating: 2}]
Output: [{price: 15, rating: 9}, {price: 15, rating: 2}, {price: 20, rating: 1}]

Input: []
Output: []
```

## Edge Cases to Consider

- Empty vector
- Single item
- All items have same price (sort by rating only)
- All items have same rating (sort by price only)
- All items identical
- Two items with exactly same price and rating

## Approach Ideas

**Using std::sort with Lambda**
```cpp
std::sort(items.begin(), items.end(), [](const Item& a, const Item& b) {
    if (a.price != b.price) {
        return a.price < b.price;  // ascending price
    }
    return a.rating > b.rating;  // descending rating
});
```

**Time Complexity:** O(n log n)  
**Space Complexity:** O(1) for in-place sorting, O(n) if creating new vector

## Testing Your Solution

Compile and run the test file to verify your solution handles all cases correctly.