#Made an edit - will merge
class Player
  def initialize(name)
    @strength = rand(20..100)
    @defense = rand(20..100) 
    @name = name
    @health = 175
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
    exit(1)
  end

  #weapon = {"sword" => Sword.new, "axe" => Axe.new}
  #puts weapon
  
  case @health
  when @health == 0
    @alive = false
  else
    @alive = true
  end

case @alive
when @alive == false
  puts "Game over!"
  exit(1)
end

  attr_accessor :health, :power, :weapon, :alive, :level, :strength, :defense

end

def attk(attacker) 
   
   dmg = ((2*attacker.level)*(attacker.power*(attacker.strength/attacker.defense))/6)
    if dmg <= 25
      dmg = 25
    end

   
   return dmg
end

def monattk(attacker) 
   dmg = ((2*attacker.level)*(attacker.power*(attacker.strength/attacker.defense))/6)
    if dmg <= 25
      dmg = 25
    end

  if dmg >=101
    dmg = 50
  end

   return dmg
end

class Monsters
  def initialize
		@type = ["Skeleton", "Sentaur", "Vampire"]
    @enemy = @type[rand(0..@type.length-1)]
    @level = 7

    #Selection of the monster's health
    @healthHash = {"Skeleton" => 100, "Sentaur" => 150, "Vampire" => 200}
    @health = @healthHash[@enemy]

    #if @enemy == "Skeleton"
     #  @health = 100
      #elsif @enemy == "Sentaur"
       #@health = 150
      #else
      # @health = 200
    #end
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

