require_relative 'Mongol'

class Archer < Mongol
    def attack(other_warrior)
        puts "#{@name} shots #{other_warrior.name} with #{@attack_damage} damage \n"
        super(other_warrior)
    end
end