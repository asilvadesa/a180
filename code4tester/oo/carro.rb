
class Carro
  attr_accessor :nome, :cor, :marca

  def initialize(nome, marca)
    @nome = nome
    @marca = marca
  end

  def ligar
    puts "#{@nome}/#{@marca}: está pronto para inciar o trajeto"
  end
end

fusca = Carro.new("Fusca", "VW")
fusca.ligar

palio = Carro.new("Palio", "Fiat")
palio.ligar