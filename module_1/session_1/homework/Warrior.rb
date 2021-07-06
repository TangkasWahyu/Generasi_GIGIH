class Warrior
    attr_reader :name

    def initialize(name, attackDamage, hitpoints)
        @name = name
        @hitpoints = hitpoints
        @attackDmg = attackDamage
    end

    def to_s
        "#{@name} has #{@hitpoints} hitpoint and #{@attackDmg} attack damage"
    end

    def attack(other)
        puts "#{@name} attacks #{other.name} with #{@attackDmg}"
        other.attacked(@attackDmg)
        puts other
    end

    def attacked(attackDamage)
        @hitpoints -= attackDamage
    end

    def isAlive?
        @hitpoints > 0
    end
end
