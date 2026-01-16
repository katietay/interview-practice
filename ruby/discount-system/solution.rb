class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(name, price, quantity)
    @items << {name: name, price: price, quantity: quantity}
    # adds a hash to the array
  end

  def total
    sum = 0
    @items.each do |item|
      sum += item[:price] * item[:quantity]
    end
    sum
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
    order.total * (@percentage / 100.0)
  end
end

class FixedDiscount < Discount
  def initialize(amount)
    @amount = amount
  end

  def apply(order)
    [@amount, order.total].min
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


  

order = Order.new
order.add_item("Shirt", 25.00, 3)
puts order.total

# Test discounts:
discount = PercentageDiscount.new(10)
puts discount.apply(order)  # 7.5

discount = FixedDiscount.new(20)
puts discount.apply(order)  # 20.0

discount = BuyXGetYDiscount.new("Shirt", 2, 1)
puts discount.apply(order)  # 25.0 (1 free shirt)