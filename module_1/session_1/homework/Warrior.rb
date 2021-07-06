class Warrior
    attr_reader :name

    def initialize(name, attackDamage, hitpoints, deflactChance = 0)
        @name = name
        @hitpoints = hitpoints
        @attackDmg = attackDamage
        @deflactChance = deflactChance
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
        randomNumber = rand(@deflactChance * 10).to_int
        randomNumber.nonzero?
    end
end
