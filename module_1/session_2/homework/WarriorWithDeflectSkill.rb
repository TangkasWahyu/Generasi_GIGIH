require_relative "Warrior"

class WarriorWithDeflectSkill < Warrior
    def initialize(name, attack_damage, hitpoints, deflect_chance)
        super(name, attack_damage, hitpoints)
        @deflect_chance = deflect_chance
    end

    def attacked(attack_damage)
        if is_deflect?
            attack_damage = 0
            puts "#{@name} deflect the attack \n\n"
        end

        super(attack_damage)
    end

    def is_deflect?
        rand <= @deflect_chance
    end
end
