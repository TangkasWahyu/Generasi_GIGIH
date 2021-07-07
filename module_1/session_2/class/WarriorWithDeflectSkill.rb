require_relative "Warrior"

class WarriorWithDeflectSkill < Warrior
    def initialize(name, attack_damage, hitpoints, deflect_chance)
        super(name, attack_damage, hitpoints)
        @deflect_chance = deflect_chance
    end

    def attacked(attack_damage)
        if is_deflect?
            attack_damage = 0
            puts "#{@name} deflect the attack"
        end

        @hitpoints -= attack_damage
    end

    def is_deflect?
        deflect_chance_ratio_number = @deflect_chance * 100
        random_number = rand(100) + 1
        random_number <= deflect_chance_ratio_number
    end
end
