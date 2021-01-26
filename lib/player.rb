require 'pry'
class Player
   attr_accessor :name,:life_points, :players

  def initialize(non)
    @name = non.to_s
    @life_points = 10
    @players = self
  end

  def show_state
    puts "#{@name} à #{@life_points} points de vie"
  end

  def gets_damage(damage_subit)
    @life_points -= damage_subit.to_i  
    puts "#{@name} à été tuer !" if @life_points <= 0
  end

  def attacks(ennemy_name)
    puts "Le joueur #{@name} attaque le joueur #{ennemy_name.name}"
    damages = compute_damage
    puts "Il lui inflige #{damages} points de vie"
    ennemy_name.gets_damage(damages)
  end

  def compute_damage
    return rand(1..6)
  end

end
binding.pry