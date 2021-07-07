require_relative 'Warrior'

class Mongol < Warrior
    def initialize(name, attack_damage, hitpoints)
        super(name, attack_damage, hitpoints)
        @is_fleed = false
        @fleed_chance = 0.5
    end

    def attack(other_warrior)
        other_warrior.attacked(@attack_damage)
    end
    
    def attacked(attack_damage)
        super(attack_damage)
        fleeing?
    end

    def fleeing?
        if rand >= @fleed_chance && @is_alive
            @is_fleed = true
            puts "#{@name} has fled the battlefield with #{@hitpoints} hitpoint left \n\n"
        end
    end
end