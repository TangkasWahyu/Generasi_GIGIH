require_relative 'WarriorWithDeflectSkill'

class WarriorWithDeflectSkillAndHealSkill < WarriorWithDeflectSkill
    def initialize(name, attack_damage, hitpoints, deflect_chance)
        super(name, attack_damage, hitpoints, deflect_chance)
        @healing_points = 20
    end

    def heal(otherWarrior)
        otherWarrior.healed(20)
        puts "#{@name} heals #{otherWarrior.name}, restoring #{@healing_points} hitpoints"
    end
end