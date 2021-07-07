class Warrior
    attr_reader :name

    def initialize(name, attack_damage, hitpoints, deflect_chance = 0)
        @name = name
        @hitpoints = hitpoints
        @attack_damage = attack_damage
        @deflect_chance = deflect_chance
    end

    def to_s
        "#{@name} has #{@hitpoints} hitpoints and #{@attack_damage} attack damage \n\n"
    end

    def is_alive?
        @hitpoints > 0
    end

    def attack(other_warrior)
        puts "#{@name} attacks #{other_warrior.name} with #{@attack_damage}"
        other_warrior.attacked(@attack_damage)
        puts other_warrior
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
