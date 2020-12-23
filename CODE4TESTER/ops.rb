
# Operadores Matematicos

def soma(n1, n2)
  puts n1+n2
end

def subtrai(n1,n2)
  puts n1-n2
end

def multiplica(n1,n2)
  puts n1*n2
end

def divide(n1,n2)
  puts (n1/n2).round(2 )
end

# soma(2,3)
# subtrai(10,8)
# multiplica(2,9)
# divide(10.0,3.0)

# Operadores de Comparacao

def maior_que(v1,v2)
  puts v1>v2
end

def menor_que(v1,v2)
  puts v1<v2
end

puts "-------"
# Retorna true, porque 2 é maior que 1
maior_que(2,1)

# Retorna false, porque 1 é maior que 8
maior_que(1,8)

# Retorna false, porque 10 não é maior que 10, é igual
maior_que(10,10)

puts "-------"

# Retorna true, porque 10 é menor que 20
menor_que(10,20)