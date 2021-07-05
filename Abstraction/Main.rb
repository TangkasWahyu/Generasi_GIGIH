require_relative 'Warrior'

jin = Warrior.new("Jin Sakai", 50, 100)
khotun = Warrior.new("Khotun Khan", 50, 500)
puts jin
puts khotun

while jin.isAlive? && khotun.isAlive?
    jin.attack(khotun)
    khotun.attack(jin)
end

jin.isDead?
khotun.isDead?