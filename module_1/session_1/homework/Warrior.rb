class Warrior
    attr_reader :name

    def initialize(name, attack_damage, hitpoints, deflect_chance = 0)
        @name = name
        @hitpoints = hitpoints
        @attack_damage = attack_damage
        @deflect_chance = deflect_chance
    end

    def to_s
        "#{@name} has #{@hitpoints} hitpoint and #{@attack_damage} attack damage \n\n"
    end

    def isAlive?
        @hitpoints > 0
    end

    def attack(other)
        puts "#{@name} attacks #{other.name} with #{@attack_damage}"
        other.attacked(@attack_damage)
        puts other
    end

    def attacked(attack_damage)
        if isDeflect?
            attack_damage = 0
            puts "#{@name} deflect the attack"
        end

        @hitpoints -= attack_damage
    end

    def isDeflect?
        return true if @deflect_chance == 1
        return false if @deflect_chance == 0

        hitted_chance_ratio_number = 100 / (100 - @deflect_chance*100)
        random_number = rand(hitted_chance_ratio_number) + 1
        random_number == hitted_chance_ratio_number
    end
end
