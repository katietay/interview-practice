class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end

class Deck
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades'].freeze
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].freeze

  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(n = 1)
    raise "Not enough cards left in the deck" if n > remaining

    if n == 1
      @cards.pop
    else
      @cards.pop(n)
    end
  end

  def remaining
    @cards.length
  end

  def empty?
    @cards.empty?
  end

  def peek
    @cards.last
  end

  def reset
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    shuffle
  end
end

