  # blackjack_score.rb

  VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 'King', 'Queen', 'Jack', 'Ace']

  def blackjack_score(hand)
    score = 0

    hand.each do |card|
      if !VALID_CARDS.include? card
        raise ArgumentError, "Non-valid card provided."
      elsif card.is_a? Numeric
        score += card
      elsif card == "King" || card == "Queen" || card == "Jack"
        score += 10
      else
        if score + 10 > 21
          score += 1
        else
          score += 11
        end
      end
    end

    if score > 21
      raise ArgumentError, "Error, hand exceeded 21."
    else
      score
    end

  end
