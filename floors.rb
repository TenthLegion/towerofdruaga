def battlesequence(mon, p1)
  puts "You draw your #{p1.weapon} and steel yourself for battle"
          until  p1.health <= 0 || mon.health <= 0
            damage = attk(p1)
            puts "GM: You swing your weapon doing #{damage} points of damage to the #{mon.enemy}"
            mon.health -= damage
            puts "GM: The #{mon.enemy} has #{mon.health} hit points left!"
            mondmg = monattk(mon)
            puts "GM: #{mon.enemy} attacks you with its full might, doing #{mondmg} points of damage"
            p1.health -= mondmg
            puts "GM: You have #{p1.health} hit points left!"
          end
        end



class Battles
  def monsterbattle(mon, p1)
    puts "GM: The #{mon.enemy} slowly approaches you. What will you do?"
    puts "Options: Run, Fight, Nothing"
    print '> '
    playerinput = gets.chomp.downcase

      case playerinput
        when "run"
          puts "GM: You attempt to run back to the entrace of the tower, but the gate is locked. 
          You hurriedly look behind you only to find #{mon.enemy} staring back at you."
          puts "GM: Its gnarled #{mon.monsterweapon} cuts you down. "
          p1.health -= 25
          puts "GM: You lose 25 points of health. health is #{p1.health}"
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
            puts "GM: Your battle cry echoes throughout the hollow cavern. With a final swing of your #{p1.weapon} you the beast's life."
            puts "GM: The door off in the distance creaks open and you pass through."
            return secondfloor(p1)
            end
          
        when "nothing"
          puts "GM: The #{mon.enemy} stalks toward you. In a flash, "
      else
          puts  "GM: You've waited too long. The #{mon.enemy} destroys you."
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
		puts "GM: You enter the ground floor. [INSERT GENERAL DESCRIPTION]. There is a door at the opposite end of the room. What do you do?"
		puts "GM: Options: Open door OR Look around"
		print '> '
 		playerinput = gets.chomp.downcase
  		
  		if playerinput.include?("open" || "door") == true
      		puts "GM: You make for the door, but a creature approaches you from the shadows!"
      		mon = Monsters.new
          puts "GM: There is a rumbling just out of sight!"
          puts "GM: You turn too slowly, as #{mon.enemy} aims its #{mon.monsterweapon} at your throat!"
          puts "GM: Its attack grazes your cheek and you take 25 points of damage. A battle has begun. You take a deep breath."
          @player.health -= 25
          return monsterbattle(mon, @player)
  		  elsif playerinput.include?("look") == true
    			 mon = Monsters.new
       		 puts "GM: In the darkness, you see a #{mon.enemy}'s eyes begin to shimmer as it recognizes your presence." 
       		 return monsterbattle(mon, @player)
  		  else
      		puts "GM: You begin to grope around in the darkness. Your hand falls upon a solid mass. Before you know it, your life has ended. Game over."
          exit(1)
      		end
  	end
  def secondfloor(p1)
      secondfloor = SecondFloor.new(p1)
      secondfloor.enter
    end
end



class SecondFloor
	def initialize (player)
    @player = player
    puts "GM: You have somehow managed to reach to the second floor."
    
  end
  def bossfloor(player)
    bar = BossRoom.new(player)
    bar.enter
  end
  def enter
    puts "GM: The room is dark. A faint light flickers in the distance.\n What do you do?"
    puts "Options: Walk to the open doors OR Look aroud"
    print "> "
    playerinput = gets.chomp.downcase

    if playerinput.include?("walk")
      puts "GM: You proceed to the door unempeded. You enter the final room."
     #var = BossRoom.new(player)
     return bossfloor(@player)
    elsif playerinput.include?("look")
        puts "GM: There sits a case in the corner. You carefully open it, finding a health potion."
        @player.health += 100
        puts "GM: The potion restores 100 points of health. Your health is now #{@player.health}."
        puts "GM: Wait a moment... you notice a necklace with a rusted pendant."
        puts "Options: Take it OR proceed through the door?"
        print "> "
        takeornot = gets.chomp.downcase
        case takeornot
        when "take"
          puts "GM: You pick up the rusted pendant and string it around your neck. It doesn't look so bad up close."
          @player.inventory = true
        when takeornot.include?("proceed" || "door" || "walk")
          puts "GM: You leave the pendant there."
        end
        puts "GM: You proceed to through the door leading to the final area."
        return bossfloor(@player)
       var.enter
      else puts "GM: Your adventure is over."
        exit(1)
      end

  end
end


class BossRoom
  
def initialize(player)
  @player = player
end

def enter
  puts "GM: You've reached the top floor. Congratu...."
  puts "GM: Wait, what's that sound?"
  boss = VampireBoss.new
  puts "#{boss.name}: Who dares enter here?"
  print "> "
  getinput = gets.chomp.downcase
  puts "#{boss.name}: I do not care. You must leave here or die."
  puts "Options: Leave OR Stay"
  print "> "
  getinput = gets.chomp.downcase
  if getinput == "stay" && @player.inventory == true
    puts "GM: #{boss.name} raises his #{boss.weapon} and brings it down upon your head."
    puts "GM: The blade moves faster than your eyes can see, but it does not hit you. The pendant you picked up begins to shine."
    puts "#{boss.name}: No! Not the pendant of the king! I am defeated!"
    puts "GM: #{boss.name} disintegrates!"
    puts "GM: Congratulations #{@player.name} you have defeated #{boss.name}.The Tower and its riches are yours!"
    exit(1)
  elsif getinput == "stay" && @player.inventory == false
    puts "GM: #{boss.name} raises his #{boss.weapon} and brings it down upon your head."
    battlesequence(boss, @player)
    puts "GM: You have lost your life in this battle."
    exit(1)
  else
    puts "GM: You turn your back only to find a sword through your chest."
    puts "GM: You lose."
    exit(1)
  end
end

end

