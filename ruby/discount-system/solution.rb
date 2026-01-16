class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(name, price, quantity)
    @items << {name: name, price: price, quantity: quantity}
    # adds a hash to the array
  end

  def subtotal
    sum = 0
    @items.each do |item|
      sum += item[:price] * item[:quantity]
    end
    sum
  end

  def discount_amount(discount)
    discount.apply(self)
  end

  def final_total(discount)
    subtotal - discount_amount(discount)
  end

  def summary(discount)
    {
      subtotal: subtotal,
      discount: discount_amount(discount),
      final_total: final_total(discount)
    }
  end
end

class Discount
  def apply(order)
    0
  end
end

class PercentageDiscount < Discount
  def initialize(percentage)
    @percentage = percentage
  end

  def apply(order)
    order.subtotal * (@percentage / 100.0)
  end
end

class FixedDiscount < Discount
  def initialize(amount)
    @amount = amount
  end

  def apply(order)
    [@amount, order.subtotal].min
  end
end

class CombinedDiscount < Discount
  def initialize(*discounts)
    @discounts = discounts
  end

  def apply(order)
    total_discount = @discounts.sum { |d| d.apply(order) }
    [total_discount, order.subtotal].min  # can't discount more than subtotal
  end
end

class BuyXGetYDiscount < Discount
  def initialize(item_name, buy_quantity, get_quantity)
    @item_name = item_name
    @buy_quantity = buy_quantity
    @get_quantity = get_quantity
  end

  def apply(order)
    item = order.items.find { |i| i[:name] == @item_name }
    return 0 unless item

    quantity = item[:quantity]
    price = item[:price]

    sets = quantity / (@buy_quantity + @get_quantity)
    free_items = sets * @get_quantity

    free_items * price
  end
end


  

# ============ TESTS ============

def test(name, expected, actual)
  status = expected == actual ? "✓ PASS" : "✗ FAIL"
  puts "#{status}: #{name}"
  puts "  Expected: #{expected}, Got: #{actual}" if expected != actual
end

puts "\n=== Basic Order Tests ==="
order = Order.new
order.add_item("Shirt", 25.00, 3)
test("Subtotal with 3 shirts at $25", 75.0, order.subtotal)

order2 = Order.new
order2.add_item("Shirt", 25.00, 2)
order2.add_item("Pants", 40.00, 1)
test("Subtotal with multiple items", 90.0, order2.subtotal)

puts "\n=== Edge Case: Empty Order ==="
empty_order = Order.new
test("Empty order subtotal", 0, empty_order.subtotal)
test("Empty order with percentage discount", 0, PercentageDiscount.new(10).apply(empty_order))
test("Empty order with fixed discount", 0, FixedDiscount.new(20).apply(empty_order))

puts "\n=== Percentage Discount Tests ==="
test("10% off $75", 7.5, PercentageDiscount.new(10).apply(order))
test("50% off $75", 37.5, PercentageDiscount.new(50).apply(order))
test("100% off $75", 75.0, PercentageDiscount.new(100).apply(order))
test("0% off $75", 0.0, PercentageDiscount.new(0).apply(order))

puts "\n=== Fixed Discount Tests ==="
test("$20 off $75", 20.0, FixedDiscount.new(20).apply(order))
test("$75 off $75 (exact)", 75.0, FixedDiscount.new(75).apply(order))
test("$100 off $75 (capped)", 75.0, FixedDiscount.new(100).apply(order))
test("$0 off $75", 0.0, FixedDiscount.new(0).apply(order))

puts "\n=== BuyXGetY Discount Tests ==="
test("Buy 2 Get 1 with 3 shirts", 25.0, BuyXGetYDiscount.new("Shirt", 2, 1).apply(order))
test("Buy 2 Get 1 with 2 shirts", 0.0, BuyXGetYDiscount.new("Shirt", 2, 1).apply(order2))
test("Buy 1 Get 1 with 3 shirts", 25.0, BuyXGetYDiscount.new("Shirt", 1, 1).apply(order))
test("Item not in order", 0.0, BuyXGetYDiscount.new("Hat", 2, 1).apply(order))

# Test with 6 shirts (2 complete sets of buy 2 get 1)
order_6_shirts = Order.new
order_6_shirts.add_item("Shirt", 25.00, 6)
test("Buy 2 Get 1 with 6 shirts (2 free)", 50.0, BuyXGetYDiscount.new("Shirt", 2, 1).apply(order_6_shirts))

puts "\n=== Combined Discount Tests ==="
combined = CombinedDiscount.new(
  PercentageDiscount.new(10),  # $7.50
  FixedDiscount.new(5)          # $5.00
)
test("10% + $5 off $75", 12.5, combined.apply(order))

puts "\n=== Edge Case: Combined discounts exceed subtotal ==="
excessive_combined = CombinedDiscount.new(
  PercentageDiscount.new(50),   # $37.50
  FixedDiscount.new(50)          # $50.00
)
test("Combined discount capped at subtotal", 75.0, excessive_combined.apply(order))

puts "\n=== Summary Method Tests ==="
discount = PercentageDiscount.new(10)
summary = order.summary(discount)
test("Summary subtotal", 75.0, summary[:subtotal])
test("Summary discount", 7.5, summary[:discount])
test("Summary final_total", 67.5, summary[:final_total])

puts "\n=== Final Total Tests ==="
test("Final total with 10% off", 67.5, order.final_total(PercentageDiscount.new(10)))
test("Final total with $20 off", 55.0, order.final_total(FixedDiscount.new(20)))
test("Final total with no discount", 75.0, order.final_total(Discount.new))