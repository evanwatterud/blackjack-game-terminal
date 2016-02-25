require_relative 'deck'

class Hand

  NUMBER_CARDS = [2, 3, 4, 5, 6, 7, 8, 9]
  FACE_CARDS = ['J', 'Q', 'K']

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    points = 0

    @cards.each do |card|
      if NUMBER_CARDS.include?(card[0].to_i)
        points += card[0].to_i
      elsif FACE_CARDS.include?(card[0]) || card[0, 2] == "10"
        points += 10
      else
        points += 1
      end
    end

    if @cards.any?{ |card| card[0] == "A" } && points < 12
      points += 10
    end
    points
  end
end
