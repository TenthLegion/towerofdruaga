#Made an edit - will merge
class Player
  def initialize(name)
    @strength = rand(20..100)
    @defense = rand(20..100) 
    @name = name
    @health = rand(30..150)
    @weapon = nil
    @level = 5
    @alive = true 
    @power = 
      if @weapon == "sword"
        power = 100
      elsif weapon == "daggers"
        power = 75
      elsif weapon == "axe"
        power = 85
      else 
        power = 20
      end
  end

  def lose
    puts "Game over!"
  end

  #weapon = {"sword" => Sword.new, "axe" => Axe.new}
  #puts weapon
  
  case @health
  when @health == 0
    @alive = false
  else
    @alive = true
  end


  attr_accessor :health
  attr_accessor :power
  attr_accessor :weapon
  attr_accessor :alive
  attr_accessor :level
  attr_accessor :strength
  attr_accessor :defense
end

def attk(attacker) 
   puts "this is the attk method."
   dmg = ((2*attacker.level)*(attacker.power*(attacker.strength/attacker.defense))/6)
    if dmg <= 25
      dmg = 25
    end

   puts "damage dealt is: #{dmg}"
   return dmg
end



class Monsters
  def initialize
		@type = ["Skeleton", "Sentaur", "Vampire"]
    @enemy = @type[rand(0..@type.length-1)]
    @level = 7
    if @enemy == "Skeleton"
       @health = 100
      elsif @enemy == "Sentaur"
       @health = 150
      else
       @health = 200
    end

    if @health.to_i <= 0
        @alive = false
     else
      @alive = true
    end
    @strength = rand(20..100)
		@defense = rand(20..100)
		
	  @weapon = [Axe.new, Sword.new,Daggers.new]
		
		@monsterweapon = @weapon[rand(0..@weapon.length-1)]
    
    if monsterweapon == Axe.new
      @power = 75
    elsif monsterweapon == Sword.new
      @power = 95
    else
    @power = 65   
    end

	end

  #Only use attr_accessor when you need a getter AND a setter 
  #and use attr_reader when you only need a getter
	attr_accessor :monsterweapon, :alive, :enemy, :health, :level, :power, :strength, :defense


end

