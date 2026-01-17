# Ruby OOP/Classes Cheat Sheet

## Quick Reference

| Concept | Syntax | Example |
|---------|--------|---------|
| Define class | `class ClassName` | `class Dog` |
| Initialize | `def initialize(params)` | `def initialize(name)` |
| Instance variable | `@variable` | `@name = "Buddy"` |
| Class variable | `@@variable` | `@@count = 0` |
| Instance method | `def method_name` | `def bark` |
| Class method | `def self.method_name` | `def self.total` |
| Getter | `attr_reader :var` | `attr_reader :name` |
| Setter | `attr_writer :var` | `attr_writer :age` |
| Both | `attr_accessor :var` | `attr_accessor :email` |
| Inherit | `class Child < Parent` | `class Dog < Animal` |
| Call parent | `super` | `super(name)` |

## Interview Tips

1. **Always initialize instance variables** in `initialize` method
2. **Use attr_accessor** instead of manual getters/setters
3. **Prefer `.each`** over `for` loops (more Ruby-like)
4. **Remember `self`** for class methods
5. **Use `super`** to call parent class methods
6. **Private methods** go after the `private` keyword
7. **Constants** are UPPERCASE

## Basic Class Structure

```ruby
class Person
  # Constructor - runs when you create a new object
  def initialize(name, age)
    @name = name  # @ = instance variable (belongs to each object)
    @age = age
  end
  
  # Instance method (called on an object)
  def greet
    "Hi, I'm #{@name} and I'm #{@age} years old"
  end
end

# Creating an object
person = Person.new("Katie", 28)
puts person.greet  # => "Hi, I'm Katie and I'm 28 years old"
```

## Instance Variables vs Class Variables

```ruby
class Product
  @@total_products = 0  # @@ = class variable (shared by all objects)
  
  def initialize(name, price)
    @name = name         # @ = instance variable (unique to each object)
    @price = price
    @@total_products += 1
  end
  
  # Class method (called on the class itself)
  def self.total_count
    @@total_products
  end
  
  # Instance method
  def display_info
    "#{@name}: $#{@price}"
  end
end

laptop = Product.new("Laptop", 999)
mouse = Product.new("Mouse", 25)

puts laptop.display_info        # => "Laptop: $999"
puts Product.total_count        # => 2
```

## Getters & Setters (attr_accessor, attr_reader, attr_writer)

```ruby
class Book
  # Manual getter and setter
  def title
    @title
  end
  
  def title=(new_title)
    @title = new_title
  end
end

# Shorthand - Ruby's magic!
class Book
  attr_accessor :title, :author  # Creates both getter and setter
  attr_reader :isbn              # Creates only getter (read-only)
  attr_writer :price             # Creates only setter (write-only)
  
  def initialize(title, author, isbn, price)
    @title = title
    @author = author
    @isbn = isbn
    @price = price
  end
end

book = Book.new("1984", "Orwell", "123456", 15.99)
puts book.title           # => "1984"
book.title = "Animal Farm"
puts book.title           # => "Animal Farm"
puts book.isbn            # => "123456"
# book.isbn = "999999"    # ERROR - no setter!
```

## Inheritance

```ruby
# Parent class (superclass)
class Animal
  def initialize(name)
    @name = name
  end
  
  def speak
    "Some generic sound"
  end
  
  def info
    "I am #{@name}"
  end
end

# Child class (subclass) - inherits from Animal
class Dog < Animal
  def initialize(name, breed)
    super(name)  # Calls parent's initialize
    @breed = breed
  end
  
  # Override parent method
  def speak
    "Woof!"
  end
  
  # Can still use parent's methods
  # info method available without redefining it
end

class Cat < Animal
  def speak
    "Meow!"
  end
end

dog = Dog.new("Buddy", "Golden Retriever")
cat = Cat.new("Whiskers")

puts dog.speak  # => "Woof!"
puts dog.info   # => "I am Buddy" (inherited method)
puts cat.speak  # => "Meow!"
```

## Access Control (public, private, protected)

```ruby
class BankAccount
  attr_reader :balance
  
  def initialize(initial_balance)
    @balance = initial_balance
  end
  
  # Public methods (default - accessible anywhere)
  def deposit(amount)
    @balance += amount
  end
  
  def withdraw(amount)
    if valid_withdrawal?(amount)
      @balance -= amount
      true
    else
      false
    end
  end
  
  private  # Everything below is private (only accessible within class)
  
  def valid_withdrawal?(amount)
    amount > 0 && amount <= @balance
  end
end

account = BankAccount.new(100)
account.deposit(50)
puts account.balance  # => 150
# account.valid_withdrawal?(30)  # ERROR - private method!
```

## Class Methods vs Instance Methods

```ruby
class Calculator
  # Instance method (needs an object)
  def add(a, b)
    a + b
  end
  
  # Class method - way 1
  def self.multiply(a, b)
    a * b
  end
  
  # Class method - way 2
  class << self
    def divide(a, b)
      a / b
    end
  end
end

# Instance method usage
calc = Calculator.new
puts calc.add(5, 3)  # => 8

# Class method usage (no object needed!)
puts Calculator.multiply(5, 3)  # => 15
puts Calculator.divide(10, 2)   # => 5
```

## Loops in Ruby

### While Loop
```ruby
# Basic while loop
counter = 0
while counter < 5
  puts counter
  counter += 1
end
# => 0, 1, 2, 3, 4

# While with break
i = 0
while true
  puts i
  i += 1
  break if i >= 3
end
# => 0, 1, 2
```

### For Loop
```ruby
# For loop (less common in Ruby)
for i in 0..4
  puts i
end
# => 0, 1, 2, 3, 4

# For with array
fruits = ["apple", "banana", "cherry"]
for fruit in fruits
  puts fruit
end
```

### Each Loop (Most Ruby-like!)
```ruby
# Each with array
[1, 2, 3, 4, 5].each do |num|
  puts num * 2
end

# Each with range
(1..5).each { |i| puts i }

# Each with index
["a", "b", "c"].each_with_index do |letter, index|
  puts "#{index}: #{letter}"
end
# => 0: a, 1: b, 2: c
```

### Times Loop
```ruby
5.times do |i|
  puts "Iteration #{i}"
end
# => Iteration 0, Iteration 1, ... Iteration 4

# Without block variable
3.times { puts "Hello!" }
```

### Until Loop
```ruby
count = 0
until count == 5
  puts count
  count += 1
end
# => 0, 1, 2, 3, 4
```

### Loop with Break/Next
```ruby
# Break - exits loop
5.times do |i|
  break if i == 3
  puts i
end
# => 0, 1, 2

# Next - skips to next iteration
5.times do |i|
  next if i == 2
  puts i
end
# => 0, 1, 3, 4
```

## Common Patterns

### ToString equivalent
```ruby
class Person
  attr_reader :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def to_s
    "Person: #{@name}, Age: #{@age}"
  end
end

person = Person.new("Katie", 28)
puts person  # => "Person: Katie, Age: 28"
```

### Comparison
```ruby
class Product
  attr_reader :price
  
  def initialize(name, price)
    @name = name
    @price = price
  end
  
  def <=>(other)
    @price <=> other.price
  end
  
  include Comparable  # Gives you <, >, <=, >=, ==
end

item1 = Product.new("Book", 10)
item2 = Product.new("Pen", 2)

puts item1 > item2  # => true
```

### Constants
```ruby
class MathHelper
  PI = 3.14159  # Constant (uppercase)
  
  def self.circle_area(radius)
    PI * radius ** 2
  end
end

puts MathHelper::PI  # => 3.14159
puts MathHelper.circle_area(5)
```

## Multiple Inheritance Alternative (Modules/Mixins)

```ruby
module Swimmable
  def swim
    "Swimming!"
  end
end

module Flyable
  def fly
    "Flying!"
  end
end

class Duck
  include Swimmable
  include Flyable
  
  def quack
    "Quack!"
  end
end

duck = Duck.new
puts duck.swim   # => "Swimming!"
puts duck.fly    # => "Flying!"
puts duck.quack  # => "Quack!"
```



