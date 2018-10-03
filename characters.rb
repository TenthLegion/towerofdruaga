class Player
  def initialize(name)
    @strength = rand(0..100)
    @defense = rand(0..100) 
    @name = name
    @health = rand(30..150)
    @weapon = nil
    @level = rand(1..5)
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
  #weapon = {"sword" => Sword.new, "axe" => Axe.new}
  #puts weapon
  def attk #(attack, defense, power, level)
    #weapon = nil
    # if @weapon.blank?
    #puts "power is blank"
    #end 

   return dmg = (((2*@level)/5)*(@power * (@strength/@defense))/12)
   puts "damage dealt is: #{dmg}"
   #puts "You do #{@dmg} points of damage!"
  end

  attr_accessor :health
  attr_accessor :power
  attr_accessor :weapon
  attr_accessor :alive
  

  
end




class Monsters
  def initialize
		@strength = rand(20..100)
		@defense = rand(20..100)
		@type = ["Skeleton", "Sentaur", "Vampire"]
	  @weapon = [Axe.new, Sword.new,Daggers.new]
		@enemy = @type[rand(0..@type.length-1)]
		#@health = #rand(20..100)
		if @enemy == "Skeleton"
			 @health = 100
		  elsif @enemy == "Sentaur"
			 @health = 150
		  else
			 @health = 200
		end
		@monsterweapon = @weapon[rand(0..@weapon.length-1)]
	end

  #Only use attr_accessor when you need a getter AND a setter 
  #and use attr_reader when you only need a getter


	attr_accessor :monsterweapon
	attr_accessor :health
  attr_accessor :enemy

  def self.monwep
    # Return the value of this variable
    return @monsterweapon
  end
end

