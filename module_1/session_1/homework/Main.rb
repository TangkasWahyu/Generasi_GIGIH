require_relative 'Warrior'

jin = Warrior.new("Jin Sakai", 50, 100, 0.8)
khotun = Warrior.new("Khotun Khan", 50, 500)
puts jin 
puts khotun

while true
    jin.attack(khotun)
    break unless khotun.isAlive? 

    khotun.attack(jin)
    break unless jin.isAlive?
end

puts "#{jin.name} is dead" unless jin.isAlive? 
puts "#{khotun.name} is dead" unless khotun.isAlive? 