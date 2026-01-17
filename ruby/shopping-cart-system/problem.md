# OOP Practice Question 1: Shopping Cart System

## Problem Statement
Design and implement a basic shopping cart system for an e-commerce platform. The cart should allow customers to add items, remove items, and calculate the total cost.

## Requirements

### Core Functionality
1. Add products to the cart
2. Remove products from the cart
3. Update product quantities
4. Calculate the total price of all items in the cart
5. Apply a simple percentage discount (if cart total exceeds a threshold)

### Classes to Consider
- `Product` - represents an item with name, price, and SKU
- `CartItem` - represents a product in the cart with quantity
- `ShoppingCart` - manages the collection of cart items

## Example Usage
```ruby
# Create products
laptop = Product.new("Laptop", 999.99, "TECH-001")
mouse = Product.new("Wireless Mouse", 29.99, "ACC-002")

# Create cart and add items
cart = ShoppingCart.new
cart.add_item(laptop, quantity: 1)
cart.add_item(mouse, quantity: 2)

# Get total
puts cart.get_total  # Should calculate: 999.99 + (29.99 * 2)

# Apply discount (e.g., 10% off orders over $1000)
cart.apply_discount(threshold: 1000, discount_percent: 10)
puts cart.get_total  # Should show discounted price

# Remove an item
cart.remove_item("ACC-002")
```

## Discussion Points
- **Encapsulation**: How are you protecting the internal state of your objects?
- **Error Handling**: What happens if someone tries to add a negative quantity? Or remove an item that doesn't exist?
- **Design Decisions**: Why did you choose these particular methods? What other functionality might be useful?
- **Edge Cases**: What if the discount makes the total negative? What if quantity is zero?

## Time Allocation
- 5 min: Understanding the problem and asking clarifying questions
- 20 min: Implementation
- 10 min: Discussion and improvements

## Skills Demonstrated
- Class design and relationships
- Method implementation
- Basic business logic
- Input validation
- Working with collections/lists

## Extension Ideas (if time permits)
- Implement a `clear_cart()` method
- Add a method to list all items in the cart
- Support multiple discount types (flat amount vs percentage)
- Prevent duplicate products (update quantity instead)