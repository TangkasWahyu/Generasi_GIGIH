require_relative 'Mongol'

class Spearman < Mongol
    def attack(other_warrior)
        puts "#{@name} thrusts #{other_warrior.name} with #{@attack_damage} damage \n"
        super(other_warrior)
    end
end