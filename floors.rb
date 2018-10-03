
class GroundFloor(player)
	@name = "Ground Floor"
	@player = player
	def enter
		puts "You enter the ground floor. [INSERT GENERAL DESCRIPTION]. There is a door at the opposite end of the room. What do you do?"
		puts "Options: 1. Open door
		2. Look around"
		print '> '
 		playerinput = gets.chomp.downcase
  		
  		if playerinput.include?("open" || "door") == true
    		puts "you make for the door, but a creature approaches you from the shadows!"
    		mon = Monster.new
  			elsif playerinput.include?("look") == true
  				mon = Monsters.new
     		 puts "you see things! A #{mon.enemy} lurks in the corner..." 
     		 return monsterbattle(mon, player)
  			else
    		puts "something"
    		puts playerinput.include?("look")
    	end
  	end
  	
  	def monsterbattle(mon, p1)
  		puts "The #{mon.enemy} slowly approaches you. What will you do?"
  		puts "Options: Run, Fight, Nothing"
  		print '> '

  		playerinput = gets.chomp.downcase

  		case playerinput
  			when "run"
  			puts "you attempt to run back to the entrace of the tower, but the gate is locked. 
  			You hurriedly look behind you only to find #{mon.enemy} staring back at you."
  			puts "What will you do?"
  			print '> '
  			playerinput = gets.chomp.downcase
  			when "fight"
  			puts "You draw your #{p1.weapon} and steel yourself for battle"
  			p1.attk

  			when "nothing"
  			puts
  			else
  			puts 	
  		end
  	end
	#nextroom = SecondFloor.new
end


class SecondFloor
	puts "this is second floor"
end


def BossRoom
end

def Map 
	@@rooms = {"Ground Floor" => GroundFloor.new, "Second Floor" => SecondFloor.new, "Boss Room" => BossRoom.new}
end

#start