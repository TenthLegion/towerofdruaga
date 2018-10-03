
#Tower of Druaga (or something similar)

#5 floors - each with a boss
#us
load 'characters.rb'
load 'floors.rb'
load 'weapons.rb'

def start
	puts "text introduction to game."
	something = gets.chomp
	case something
	when "asdf"
		GroundFloor.new
	else
		puts "this did not work"
	end

end



puts "Game Master: Welcome to the tower of Druaga! Many dangers and challenges await you from here. What is your name?"
print "> "
player_name = $stdin.gets.chomp

puts "Game Master: Do you wish to embark on this adventure, #{player_name}?"
print "> "
proceedYN = $stdin.gets.chomp.downcase
p1 = Player.new(player_name)

case proceedYN
  when "yes"
    puts "Game Master: It is dangerous to go alone, take this: "
    puts "A shining sword, a sharp axe, and two daggers float before you. Which will you take?"
    print '> '
      chooseweapon = gets.chomp.downcase
        case chooseweapon
          when "sword"
            p1.weapon = "sword"
          #p1.instance_variable_set(:@weapon, Sword.new)
           # if p1.weapon.instance_of?(Sword)
            #  p1.weaponpower.setpower
            #end
            when "axe"
              p1.weapon = "axe"
            when "daggers" || "dagger"
              weapon = "daggers"
            else
              puts "Game Master: Please chooese either: Sword, Daggers, or Axe."
              print '> '
              chooseweapon = gets.chomp.downcase
          end
          puts "Game Master: Now take your #{p1.weapon}! Be ready!"
  else
    puts "Game Master: Please return when you are ready to embark on an adventure."
    exit(1)
end


#if proceedYN == "yes"
 # GroundFloor.new
#end

unless p1.alive == false
  floor1 =  GroundFloor.new(p1)
  floor1.enter
  #puts mon.monsterweapon





 end 

def end
    exit(1)
  
  end


#puts "your weapon is: #{p1.weapon}"
#puts "your power is: #{p1.power}"

#puts p1.instance_variable_get(:@weapon)
#puts p1.instance_variable_get(:@power)
#puts "this is weapon power: #{p1.weaponpower.inspect}"
#puts "this is weapon: #{p1.weapon.instance_variable_get("@@name")}"
#puts @weapon.instance_variable_get(:@name)
#puts weapon.nil? 

#puts "damage is : #{p1.attk}"

#user = Player.new
#puts user.inspect

#start




#me = Monsters.new
#puts me.inspect + "\n"
#puts "your health score is: #{me.health}"
#puts me.@monsterweapon.@attack.inspect

