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

  def deal_cards_to_player(num)
    cards = @deck.deal(num)
    @player.recieve_cards(cards)
    cards.each { |card| puts "Player was dealt #{card.rank}#{card.suit}" }
  end

  def deal_cards_to_computer(num)
    cards = @deck.deal(num)
    @computer.recieve_cards(cards)
    cards.each { |card| puts "Computer was dealt #{card.rank}#{card.suit}" }
  end

  def player_bust?
    player_score > 21 ? true : false
  end

  def computer_bust?
    computer_score > 21 ? true : false
  end

  def player_score
    @player.calculate_hand
  end

  def computer_score
    @computer.calculate_hand
  end

  def update_player_score
    "Player score: #{player_score}"
  end

  def update_computer_score
    "Computer score: #{computer_score}"
  end

  def winner
    if player_score > computer_score
      "You Win!"
    elsif computer_score > player_score
      "Computer Wins!"
    else
      "Tie!"
    end
  end
end
