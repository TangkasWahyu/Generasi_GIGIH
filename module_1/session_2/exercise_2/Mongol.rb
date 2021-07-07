require_relative 'Warrior'

class Mongol < Warrior
    def initialize(name, attack_damage, hitpoints)
        super(name, attack_damage, hitpoints)
        @is_fleed = false
    end

    def attack(other_warrior)
        other_warrior.attacked(@attack_damage)
    end
    

    def attacked(attack_damage)
        super(attack_damage)
        fleeding?
    end

    def fleeding?
        if rand >= 0.5
            @is_fleed = true
            puts "#{@name} has fled the battlefield with #{@hitpoints} hitpoint left \n\n"
        end
    end
end