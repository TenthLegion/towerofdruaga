def battlesequence(mon, p1)
  puts "You draw your #{p1.weapon} and steel yourself for battle"
          until  p1.health <= 0 || mon.health <= 0
            puts "monster power is #{mon.power}"
            damage = attk(p1)
            puts "You swing your weapon doing #{damage} points of damage to the #{mon.enemy}"
            mon.health -= damage
            puts "The #{mon.enemy} has #{mon.health} hit points left!"

            mondmg = monattk(mon)
            puts "#{mon.enemy} attacks you with its full might, doing #{mondmg} points of damage"
            p1.health -= mondmg
            puts "You have #{p1.health} hit points left!"
          end
        end



class Battles
  def monsterbattle(mon, p1)
    puts "The #{mon.enemy} slowly approaches you. What will you do?"
    puts "Options: Run, Fight, Nothing"
    print '> '
    playerinput = gets.chomp.downcase

      case playerinput
        when "run"
          puts "you attempt to run back to the entrace of the tower, but the gate is locked. 
          You hurriedly look behind you only to find #{mon.enemy} staring back at you."
          puts "Its gnarled #{mon.monsterweapon} cuts you down. "
          p1.health -= 25
          puts "You lose 25 points of health. health is #{p1.health}"
          battlesequence(mon, p1)
          
        when "fight"
          battlesequence(mon, p1)
           if mon.health <= 0
              mon.alive = false
            end

            if p1.health <= 0
                p1.alive = false
            end

            if p1.alive == false
            puts "The #{mon.enemy}'s final strike defeats you."
            p1.lose
            end
            if mon.alive == false
            puts "Your battle cry echoes throughout the hollow cavern. With a final swing of your #{p1.weapon} you the beast's life."
            puts "The door off in the distance creaks open and you pass through."
            return secondfloor(p1)
            end
          
        when "nothing"
          puts "The #{mon.enemy} stalks toward you. In a flash, "
      else
          puts  "You've waited too long. The #{mon.enemy} destroys you."
          p1.lose
      end
      
    end
end




class GroundFloor < Battles

  def initialize (player)
    @player = player




  end

	@name = "Ground Floor"
	def enter
		puts "You enter the ground floor. [INSERT GENERAL DESCRIPTION]. There is a door at the opposite end of the room. What do you do?"
		puts "Options: \n 1. Open door \n 2. Look around"
		print '> '
 		playerinput = gets.chomp.downcase
  		
  		if playerinput.include?("open" || "door") == true
      		puts "you make for the door, but a creature approaches you from the shadows!"
      		mon = Monsters.new
          puts "There is a rumbling just out of sight!"
          puts "You turn too slowly, as #{mon.enemy} aims its #{mon.monsterweapon} at your throat!"
          puts "It's attack grazes your cheek and you take 25 points of damage. A battle has begun. You take a deep breath."
          @player.health -= 25
          return monsterbattle(mon, @player)
  		  elsif playerinput.include?("look") == true
    			 mon = Monsters.new
       		 puts "you see things! A #{mon.enemy} lurks in the corner..." 
       		 return monsterbattle(mon, @player)
  		  else
      		puts "something"
      		puts playerinput.include?("look")
    	end
  	end


def secondfloor(p1)
    secondfloor = SecondFloor.new(p1)
    secondfloor.enter
  end
end

def bossfloor
  BossRoom.new
end

class SecondFloor
	def initialize (player)
    @player = player
    puts "this is second floor"
  end
  def enter
    puts "this is enter"
  end
end


def BossRoom
end

def Map 
	@@rooms = {"Ground Floor" => GroundFloor.new, "Second Floor" => SecondFloor.new, "Boss Room" => BossRoom.new}
end

