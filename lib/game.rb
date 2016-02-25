require_relative "hand"
require_relative "deck"

class Game
  attr_reader :welcome

  def initialize
    @deck = Deck.new
    @player = Hand.new
    @computer = Hand.new
    @welcome = "Welcome to Blackjack!"
  end


end
