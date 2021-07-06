require_relative 'Warrior'

jin = Warrior.new("Jin Sakai", 50, 100, 0.8)
khotun = Warrior.new("Khotun Khan", 50, 500)
puts jin 
puts khotun

while true
    jin.attack(khotun)
    break unless khotun.is_alive? 

    khotun.attack(jin)
    break unless jin.is_alive?
end

puts "#{jin.name} is dead" unless jin.is_alive? 
puts "#{khotun.name} is dead" unless khotun.is_alive? 