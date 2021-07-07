require_relative 'Mongol'

class Swordman < Mongol
    def initialize(name, attack_damage, hitpoints)
        super(name, attack_damage, hitpoints)
    end

    def attack(other_warrior)
        puts "#{@name} slash #{other_warrior.name} with #{@attack_damage} damage \n"
        super(other_warrior)
    end
end