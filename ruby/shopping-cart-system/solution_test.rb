require 'minitest/autorun'
require_relative 'solution'

class ProductTest < Minitest::Test
  def test_creates_product_with_attributes
    product = Product.new("Laptop", 999.99, "TECH-001")

    assert_equal "Laptop", product.name
    assert_equal 999.99, product.price
    assert_equal "TECH-001", product.sku
  end
end

class CartItemTest < Minitest::Test
  def setup
    @product = Product.new("Laptop", 999.99, "TECH-001")
  end

  def test_creates_cart_item_with_default_quantity
    item = CartItem.new(@product)

    assert_equal @product, item.product
    assert_equal 1, item.quantity
  end

  def test_creates_cart_item_with_specified_quantity
    item = CartItem.new(@product, 3)

    assert_equal 3, item.quantity
  end

  def test_calculates_subtotal
    item = CartItem.new(@product, 2)

    assert_equal 1999.98, item.get_subtotal
  end

  def test_raises_error_for_zero_quantity
    assert_raises(ArgumentError) { CartItem.new(@product, 0) }
  end

  def test_raises_error_for_negative_quantity
    assert_raises(ArgumentError) { CartItem.new(@product, -1) }
  end
end

class ShoppingCartTest < Minitest::Test
  def setup
    @cart = ShoppingCart.new
    @laptop = Product.new("Laptop", 999.99, "TECH-001")
    @mouse = Product.new("Wireless Mouse", 29.99, "ACC-002")
  end

  # Adding items
  def test_adds_item_to_empty_cart
    @cart.add_item(@laptop, quantity: 1)

    assert_equal 1, @cart.items.size
    assert_equal 1, @cart.items["TECH-001"].quantity
  end

  def test_adds_same_product_twice_updates_quantity
    @cart.add_item(@laptop, quantity: 1)
    @cart.add_item(@laptop, quantity: 2)

    assert_equal 1, @cart.items.size
    assert_equal 3, @cart.items["TECH-001"].quantity
  end

  def test_raises_error_for_zero_quantity_on_add
    assert_raises(ArgumentError) { @cart.add_item(@laptop, quantity: 0) }
  end

  def test_raises_error_for_negative_quantity_on_add
    assert_raises(ArgumentError) { @cart.add_item(@laptop, quantity: -1) }
  end

  # Removing items
  def test_removes_item_from_cart
    @cart.add_item(@laptop, quantity: 1)
    @cart.remove_item("TECH-001")

    assert_equal 0, @cart.items.size
  end

  def test_raises_error_removing_nonexistent_item
    assert_raises(ArgumentError) { @cart.remove_item("FAKE-SKU") }
  end

  # Updating quantity
  def test_updates_quantity
    @cart.add_item(@laptop, quantity: 1)
    @cart.update_quantity("TECH-001", 5)

    assert_equal 5, @cart.items["TECH-001"].quantity
  end

  def test_update_quantity_to_zero_removes_item
    @cart.add_item(@laptop, quantity: 1)
    @cart.update_quantity("TECH-001", 0)

    assert_equal 0, @cart.items.size
  end

  def test_update_quantity_to_negative_removes_item
    @cart.add_item(@laptop, quantity: 1)
    @cart.update_quantity("TECH-001", -1)

    assert_equal 0, @cart.items.size
  end

  # Totals
  def test_get_total_empty_cart
    assert_equal 0, @cart.get_total
  end

  def test_get_total_single_item
    @cart.add_item(@laptop, quantity: 1)

    assert_equal 999.99, @cart.get_total
  end

  def test_get_total_multiple_items
    @cart.add_item(@laptop, quantity: 1)
    @cart.add_item(@mouse, quantity: 2)

    assert_in_delta 1059.97, @cart.get_total, 0.01
  end

  # Discounts
  def test_discount_not_applied_below_threshold
    @cart.add_item(@laptop, quantity: 1)
    @cart.apply_discount(threshold: 1000, discount_percent: 10)

    assert_equal 999.99, @cart.get_total
  end

  def test_discount_applied_at_threshold
    @cart.add_item(@laptop, quantity: 1)
    @cart.add_item(@mouse, quantity: 1)
    @cart.apply_discount(threshold: 1000, discount_percent: 10)

    expected = (999.99 + 29.99) * 0.9
    assert_in_delta expected, @cart.get_total, 0.01
  end

  def test_discount_with_zero_threshold_always_applies
    @cart.add_item(@mouse, quantity: 1)
    @cart.apply_discount(threshold: 0, discount_percent: 10)

    expected = 29.99 * 0.9
    assert_in_delta expected, @cart.get_total, 0.01
  end

  def test_discount_with_zero_percent_no_change
    @cart.add_item(@laptop, quantity: 1)
    @cart.apply_discount(threshold: 0, discount_percent: 0)

    assert_equal 999.99, @cart.get_total
  end

  def test_discount_stops_applying_when_below_threshold
    @cart.add_item(@laptop, quantity: 1)
    @cart.add_item(@mouse, quantity: 1)
    @cart.apply_discount(threshold: 1000, discount_percent: 10)

    # Discount applies
    assert @cart.get_total < 1029.98

    # Remove item, now below threshold
    @cart.remove_item("ACC-002")

    # Discount no longer applies
    assert_equal 999.99, @cart.get_total
  end

  def test_raises_error_for_negative_discount_percent
    assert_raises(ArgumentError) do
      @cart.apply_discount(threshold: 100, discount_percent: -10)
    end
  end

  def test_raises_error_for_discount_over_100_percent
    assert_raises(ArgumentError) do
      @cart.apply_discount(threshold: 100, discount_percent: 101)
    end
  end

  def test_remove_discount
    @cart.add_item(@laptop, quantity: 2)
    @cart.apply_discount(threshold: 1000, discount_percent: 10)

    discounted_total = @cart.get_total
    @cart.remove_discount
    full_total = @cart.get_total

    assert full_total > discounted_total
    assert_in_delta 1999.98, full_total, 0.01
  end
end
