class Warrior
    attr_reader :name, :attackDmg

    def initialize(name, attackDmg, hitpoints)
        @name = name
        @hitpoints = hitpoints
        @attackDmg = attackDmg
    end

    def to_s
        "#{@name} has #{@hitpoints} hitpoint and #{@attackDmg} attack damage"
    end

    def attack(other)
        puts "#{@name} attacks #{other.name} with #{@attackDmg}"
        attackedBy(other)
    end

    def attackedBy(other)
        @hitpoints -= other.attackDmg
        puts other
    end

    def isAlive?
        @hitpoints > 0
    end

    def isDead?
        if !isAlive?
            puts "#{@name} is dead"
        end 
    end
end
