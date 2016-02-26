require_relative 'deck'

class Hand

  NUMBER_CARDS = [2, 3, 4, 5, 6, 7, 8, 9]
  TEN_CARDS = ["10", 'J', 'Q', 'K']

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def recieve_cards(cards_dealt)
    cards_dealt.each { |card| @cards << card }
  end

  def calculate_hand
    points = 0

    @cards.each do |card|
      if NUMBER_CARDS.include?(card.rank.to_i)
        points += card.rank.to_i
      elsif TEN_CARDS.include?(card.rank)
        points += 10
      else
        points += 1
      end
    end

    if @cards.any?{ |card| card.rank == "A" } && points < 12
      points += 10
    end
    points
  end
end
