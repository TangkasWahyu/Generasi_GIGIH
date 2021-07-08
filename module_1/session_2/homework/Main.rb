require_relative 'WarriorWithDeflectSkillAndHealSkill'
require_relative 'Warrior'
require_relative 'Swordman'
require_relative 'Spearman'
require_relative 'Archer'

jin = WarriorWithDeflectSkillAndHealSkill.new("Jin Sakai", 50, 100, 0)

yuna = Warrior.new("Yuna", 45, 90)
sensei = Warrior.new("Sensei Ishikawa", 60, 80)

archer = Archer.new("Mongol Archer", 40, 80)
spearman = Spearman.new("Mongol Spearman", 50, 120)
swordman = Swordman.new("Mongol Swordman", 60, 100)

allies = [yuna, sensei]
villains = [archer, spearman, swordman]
jin_team = [jin, *allies]
turn = 1

loop do
    puts "======= Turn #{turn} ======= \n\n"

    puts jin
    allies.each do | ally |
        puts ally
    end
    puts "\n"

    villains.each do | villain |
        puts villain
    end
    puts "\n"

    puts "As #{jin.name}. what do you want to do in this turn?"
    puts "1) Attack an enemy"
    puts "2) Heal an ally" 

    attack_or_heal = gets.chomp.to_i
    case attack_or_heal
        when 1
            puts "Which enemy you want to attack?"
            villains.each_with_index do | villain, index |
                puts "#{index + 1}) #{villain}"
            end
            index_of_villain = gets.chomp.to_i

            villain = villains[index_of_villain - 1]
            jin.attack(villain)

            puts "#{villain.name} dies \n\n" if not villain.is_alive?
            villains.delete(villain) if (not villain.is_alive?) || villain.is_fleed

            break unless not villains.empty?
        when 2
            puts "Which ally you want to heal?"
            allies.each_with_index do | alley, index |
                puts "#{index + 1}) #{alley}"
            end
            index_of_ally = gets.chomp.to_i

            jin.heal(allies[index_of_ally - 1])
        else
            puts "Please input 1 or 2"
    end
    break unless not villains.empty?

    allies.each do |ally|
        villains_index = rand(villains.length)
        villain = villains[villains_index]

        ally.attack(villain)

        puts "#{villain.name} dies\n\n" if not villain.is_alive?
        villains.delete(villain) if (not villain.is_alive?) || villain.is_fleed

        break unless not villains.empty?
    end
    break unless not villains.empty?
    puts "\n"

    villains.each do |villain|
        jin_team_index = rand(jin_team.length)
        someone_from_jin_team = jin_team[jin_team_index]

        villain.attack(someone_from_jin_team)

        puts "#{someone_from_jin_team.name} is dies" unless someone_from_jin_team.is_alive? 
        if (not someone_from_jin_team.is_alive?)
            jin_team.delete(someone_from_jin_team) 
            allies.delete(someone_from_jin_team) 
        end
        
        break unless jin.is_alive? 
    end
    break unless jin.is_alive? 

    turn += 1
end
