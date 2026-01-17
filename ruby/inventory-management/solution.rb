class Product
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reserve(*)
    raise NotImplementedError, "Subclasses must implement reserve"
  end

  def check_stock
    raise NotImplementedError, "Subclasses must implement check_stock"
  end
end

class SimpleProduct < Product
  attr_reader :stock

  def initialize(name, stock: 0)
    super(name)
    @stock = stock
  end

  def reserve(quantity)
    if quantity <= 0
      puts "Invalid quantity: #{quantity} - must be a positive number"
      return false
    end

    if quantity > @stock
      puts "Failed to reserve #{quantity} of '#{name}' - only #{@stock} in stock"
      false
    else
      @stock -= quantity
      puts "Reserved #{quantity} of '#{name}' - #{@stock} remaining"
      true
    end
  end

  def check_stock
    @stock
  end
end

class VariantProduct < Product
  def initialize(name)
    super(name)
    @variants = {}
  end

  def add_variant(variant_name, stock: 0)
    @variants[variant_name] = stock
  end

  def reserve(variant_name, quantity)
    if quantity <= 0
      puts "Invalid quantity: #{quantity} - must be a positive number"
      return false
    end

    unless @variants.key?(variant_name)
      puts "Variant '#{variant_name}' not found for '#{name}'"
      return false
    end

    if quantity > @variants[variant_name]
      puts "Failed to reserve #{quantity} of '#{name}' (#{variant_name}) - only #{@variants[variant_name]} in stock"
      false
    else
      @variants[variant_name] -= quantity
      puts "Reserved #{quantity} of '#{name}' (#{variant_name}) - #{@variants[variant_name]} remaining"
      true
    end
  end

  def check_stock(variant_name = nil)
    if variant_name
      @variants[variant_name]
    else
      @variants.dup
    end
  end
end


# Create products
simple_product = SimpleProduct.new("Coffee Mug", stock: 100)
variant_product = VariantProduct.new("T-Shirt")
variant_product.add_variant("Small/Blue", stock: 20)
variant_product.add_variant("Large/Red", stock: 15)

# Try to reserve stock
simple_product.reserve(5)  # Should work, reduces stock to 95
variant_product.reserve("Small/Blue", 25)  # Should fail - not enough stock

# Test invalid quantities
puts "\n--- Testing invalid quantities ---"
simple_product.reserve(0)   # Should fail - zero
simple_product.reserve(-5)  # Should fail - negative
variant_product.reserve("Large/Red", 0)   # Should fail - zero
variant_product.reserve("Large/Red", -10) # Should fail - negative