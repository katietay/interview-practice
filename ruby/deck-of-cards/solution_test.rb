require 'minitest/autorun'
require_relative 'solution'

class CardTest < Minitest::Test
  def test_card_has_suit_and_rank
    card = Card.new('Hearts', 'Ace')
    assert_equal 'Hearts', card.suit
    assert_equal 'Ace', card.rank
  end

  def test_card_to_s
    card = Card.new('Spades', 'King')
    assert_equal 'King of Spades', card.to_s
  end
end

class DeckTest < Minitest::Test
  def setup
    @deck = Deck.new
  end

  def test_deck_has_52_cards
    assert_equal 52, @deck.remaining
  end

  def test_deal_removes_one_card
    @deck.deal
    assert_equal 51, @deck.remaining
  end

  def test_deal_multiple_cards
    cards = @deck.deal(5)
    assert_equal 5, cards.length
    assert_equal 47, @deck.remaining
  end

  def test_deal_raises_when_not_enough_cards
    @deck.deal(52)
    assert_raises(RuntimeError) { @deck.deal }
  end

  def test_empty_returns_true_when_no_cards
    @deck.deal(52)
    assert @deck.empty?
  end

  def test_empty_returns_false_when_cards_remain
    refute @deck.empty?
  end

  def test_peek_returns_top_card_without_removing
    top = @deck.peek
    assert_equal 52, @deck.remaining
    assert_equal top, @deck.peek
  end

  def test_shuffle_randomizes_deck
    original_top = @deck.peek
    @deck.shuffle
    # Note: there's a tiny chance this fails if shuffle puts same card on top
    # Running multiple times makes false positive extremely unlikely
    different = false
    10.times do
      @deck.reset
      different = true if @deck.peek != original_top
    end
    assert different, "Shuffle should randomize card order"
  end

  def test_reset_restores_full_deck
    @deck.deal(30)
    @deck.reset
    assert_equal 52, @deck.remaining
  end
end
