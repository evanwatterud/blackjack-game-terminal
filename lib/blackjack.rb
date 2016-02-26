require_relative "game"

class InputError < StandardError
end

game = Game.new

puts game.welcome
puts " "

game.deal_cards_to_player(2)
puts game.update_player_score
puts " "

while true
  print "Hit or stand (H/S):"
  answer = gets.chomp
  puts " "
  if answer.downcase == "h"
    game.deal_cards_to_player(1)
    puts game.update_player_score
    puts " "
    abort("Bust, you lose...") if game.player_bust?
  elsif answer.downcase == "s"
    break
  else
    raise InputError
  end
end

game.deal_cards_to_computer(2)
puts game.update_computer_score
puts " "

while game.computer_score < 17
  game.deal_cards_to_computer(1)
  puts game.update_computer_score
  puts " "
  abort("Dealer busts, you win!") if game.computer_bust?
end

puts game.winner
