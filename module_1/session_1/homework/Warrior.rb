class Warrior
    attr_reader :name

    def initialize(name, attackDamage, hitpoints, deflectChance = 0)
        @name = name
        @hitpoints = hitpoints
        @attackDmg = attackDamage
        @deflectChance = deflectChance
    end

    def to_s
        "#{@name} has #{@hitpoints} hitpoint and #{@attackDmg} attack damage \n\n"
    end

    def isAlive?
        @hitpoints > 0
    end

    def attack(other)
        puts "#{@name} attacks #{other.name} with #{@attackDmg}"
        other.attacked(@attackDmg)
        puts other
    end

    def attacked(attackDamage)
        if isDeflect?
            attackDamage = 0
            puts "#{@name} deflect the attack"
        end

        @hitpoints -= attackDamage
    end

    def isDeflect?
        return true if @deflectChance == 1
        return false if @deflectChance == 0

        hittedChanceRatioNumber = 100 / (100 - @deflectChance*100)
        randomNumber = rand(hittedChanceRatioNumber) + 1
        randomNumber == hittedChanceRatioNumber
    end
end
