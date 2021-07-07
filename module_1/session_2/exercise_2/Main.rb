require_relative 'WarriorWithDeflectSkill'
require_relative 'Swordman'
require_relative 'Spearman'
require_relative 'Archer'

jin = WarriorWithDeflectSkill.new("Jin Sakai", 50, 100, 0.8)
archer = Archer.new("Mongol Archer", 40, 80)
spearman = Spearman.new("Mongol Spearman", 50, 120)
swordman = Swordman.new("Mongol Swordman", 60, 100)

villains = [archer, spearman, swordman]
attack_index = 0;
turn = attack_index + 1

loop do
    puts "======= Turn #{turn} ======= \n\n"

    puts jin
    villains.each do | villain |
        puts villain
    end

    puts "\n"

    villain_index = attack_index % villains.length
    villain = villains[villain_index]

    jin.attack(villain)
    villains.delete(villain) if (not villain.is_alive?) || villain.is_fleed
    puts "#{villain.name} dies" if not villain.is_alive?
    break unless not villains.empty?

    villains.each do |villain|
        villain.attack(jin)
        break unless jin.is_alive? 
    end
    break unless jin.is_alive? 

    attack_index += 1
    turn = attack_index + 1
end

puts "#{jin.name} is dies" unless jin.is_alive? 
