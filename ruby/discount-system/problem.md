Problem: Discount System
We need you to build a discount system for our e-commerce platform. Customers can have different types of discounts applied to their orders:

Percentage discounts (e.g., 10% off)
Fixed amount discounts (e.g., $20 off)
Buy X Get Y free (e.g., buy 2 shirts, get 1 free)

A customer's order can have multiple line items, and we need to calculate the final total after applying the appropriate discount.
Here's a starting point - you have an order with line items:
ruby# Example usage we want to support:

```order = Order.new
order.add_item("T-Shirt", 25.00, 3)  # 3 shirts at $25 each
order.add_item("Jeans", 50.00, 1)    # 1 pair of jeans at $50
# Apply discount and calculate total
```

