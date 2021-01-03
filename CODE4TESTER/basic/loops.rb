
5.times do
  puts "Executando times"
end
puts "----------------"
bandas = ["Pepe e Nenem", "Sampa Crew", "Adriana e a Rapaziada", "Os Travessos"]
i = 0
bandas.size.times do
  puts bandas[i]
  i=i+1
end

puts "----------------"

bandas.each { |banda|  puts banda}
puts "----------------"
bandas.each do |banda|
  puts banda
end