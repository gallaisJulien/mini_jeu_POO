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

  def attacks(enemy_name)
    puts "Le joueur #{@name} attaque le joueur #{enemy_name.name}"
    damages = compute_damage
    puts "Il lui inflige #{damages} points de vie"
    enemy_name.gets_damage(damages)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(nom)
    @weapon_level = 1
    @name = nom
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} de vies et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    search = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{search}"
    if @weapon_level < search
      @weapon_level = search
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    search_health = rand(1..6)

    if search_health == 1
      puts "Tu n'as rien trouvé... "

    elsif search_health.between?(2, 5)
      @life_points += 50 
      if @life_points > 100
        @life_points = 100
      end

      puts "Bravo, tu as trouvé un pack de +50 points de vie!"

    elsif search_health == 6
      @life_points += 80 
      if @life_points > 100 
        @life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie!"
    end
  end

end
binding.pry