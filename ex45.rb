
#Tower of Druaga (or something similar)

#5 floors - each with a boss
#us
load 'characters.rb'
load 'floors.rb'
load 'weapons.rb'

def notetoself
 puts "NOTES TO SELF:"
  puts "- Find way to take new input after 'Run' and start the other conditions."
  puts "- Finish the Nothing Scenario"
  puts "- Find way to initialize the second floor after Fight has been won."
  puts "- Figure out why the mon.monsterweapon produces 'Its gnarled #<Sword:0x007fdafa0c2448> cuts you down.' instead of weapon name."
  puts "- Clean up excess puts in the attk method."
  10.times do print "#" end
    puts "\n"
  puts "- clean up all stray notes in the code."
  puts "- Figure out why i cant put the start stuff in a method called start."

end


input = gets.chomp.downcase

if input == "note"
  notetoself
else input != "note"
  




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

unless p1.alive == false
  floor1 =  GroundFloor.new(p1)
  floor1.enter
  #puts mon.monsterweapon
 end 

end
