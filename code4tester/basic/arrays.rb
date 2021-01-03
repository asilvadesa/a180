
bandas = ["Charlie Brown Jr", "CPM22", "Natiruts", "Planet Hemp"]

puts "----------------"
puts bandas[0]
puts bandas[1]
puts bandas[2]
puts bandas[3]

bandas.push("Racionais MC's")

puts bandas[4]
puts "----------------"
bandas.delete("CPM22")
puts bandas
puts "----------------"

puts "----------------"
reggae = bandas.find {|item| item == "Natiruts"}
puts reggae
puts "----------------"
puts "----------------"

mcs = bandas.find {|item| item.include?("MC's")}
puts mcs

puts "----------------"