require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjac Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [8, 6]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 14

  end

  it 'facecards have values calculated correctly' do

    hand = [9, 1, "King"]

    score = blackjack_score(hand)
    expect(score).must_equal 20

    hand = [1, "Jack", "Queen"]

    score = blackjack_score(hand)
    expect(score).must_equal 21

  end

  it 'calculates aces as 11 where it does not go over 21' do

    score = blackjack_score(["King", "Ace"])
    expect(score).must_equal 21

    score = blackjack_score([3, 2, "Ace"])
    expect(score).must_equal 16

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    score = blackjack_score(["King", "Jack", "Ace"])
    expect(score).must_equal 21

    score = blackjack_score([8, 9, "Ace"])
    expect(score).must_equal 18

  end

  it 'raises an ArgumentError for invalid cards' do

    expect{
      blackjack_score(["Ice cream", 100, "My pet spider"])
    }.must_raise ArgumentError

    expect{
      blackjack_score([-6, "To infinity and beyond!", 200])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do
    expect{
      blackjack_score([9, 9, 9])
    }.must_raise ArgumentError

    expect{
      blackjack_score(["Jack", 9, 8])
    }.must_raise ArgumentError

    expect{
      blackjack_score(["Jack", "Queen", "Ace", 1])
    }.must_raise ArgumentError

  end
end
