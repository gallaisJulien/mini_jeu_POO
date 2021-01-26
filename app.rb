require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Voici l'état de chaque joueur: "
puts "                               "
puts player1.show_state
puts player2.show_state
puts "                               "
puts "Passons à la phase d'attaque : "
puts "                               "
puts "          Fight!               "
player2.attacks(player1)
player1.attacks(player2)
puts "                               "
puts "Voici l'état de chaque joueur: "
puts "                               "
puts player1.show_state
puts player2.show_state

while player1.life_points > 0 && player2.life_points > 0
  player2.attacks(player1)
  if player1.life_points <= 0
    break
  end
  player1.attacks(player2)
end

#binding.pry