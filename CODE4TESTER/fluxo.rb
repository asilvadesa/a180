puts "Qual o seu nome?"
nome = gets.chomp

puts "Informe a sua idade"
idade = gets.chomp.to_i

if(idade >= 18)
  puts nome + ", você já pode tirar a CNH"
elsif (idade >=7)
  puts nome + ", você pode andar somente de bicicleta"
else
  puts nome + ", pode andar apenas a pé"
end

