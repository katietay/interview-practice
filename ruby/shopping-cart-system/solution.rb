class Product
  attr_reader :name, :price, :sku

  def initialize(name, price, sku)
    @name = name
    @price = price
    @sku = sku
  end
end

class CartItem
  attr_reader :product, :quantity

  def initialize(product, quantity = 1)
    raise ArgumentError, "Quantity must be at least 1" if quantity < 1

    @product = product
    @quantity = quantity
  end

  def get_subtotal
    @product.price * @quantity
  end
end

class ShoppingCart
  attr_reader :items

  def initialize
    @items = {}
    @discount_threshold = nil
    @discount_percent = nil
  end

  def add_item(product, quantity: 1)
    raise ArgumentError, "Quantity must be at least 1" if quantity < 1

    if @items.key?(product.sku)
      current_quantity = @items[product.sku].quantity
      @items[product.sku] = CartItem.new(product, current_quantity + quantity)
    else
      @items[product.sku] = CartItem.new(product, quantity)
    end
  end

  def remove_item(sku)
    raise ArgumentError, "Item not found in cart" unless @items.key?(sku)

    @items.delete(sku)
  end

  def update_quantity(sku, new_quantity)
    raise ArgumentError, "Item not found in cart" unless @items.key?(sku)

    if new_quantity < 1
      remove_item(sku)
    else
      product = @items[sku].product
      @items[sku] = CartItem.new(product, new_quantity)
    end
  end

  def get_total
    @items.values.sum(&:get_subtotal)
  end

  def apply_discount(threshold:, discount_percent:)
    raise ArgumentError, "Discount percent must be between 0 and 100" if discount_percent < 0 || discount_percent > 100

    total = get_total
    if total >= threshold
      total * (1 - discount_percent / 100.0)
    else
      total
    end
  end
end