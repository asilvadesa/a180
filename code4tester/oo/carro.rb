
class Carro
  attr_accessor :nome, :cor, :marca

  def ligar
    puts "O #{@nome} está pronto para inciar o trajeto"
  end
end

fusca = Carro.new
fusca.nome = "Fusca"
fusca.ligar


palio = Carro.new
palio.nome = "Palio"
palio.ligar