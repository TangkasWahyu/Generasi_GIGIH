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
        return true if @deflect_chance == 1
        return false if @deflect_chance == 0

        hitted_chance_ratio_number = 100 / (100 - @deflect_chance*100)
        random_number = rand(hitted_chance_ratio_number) + 1
        random_number == hitted_chance_ratio_number
    end
end
