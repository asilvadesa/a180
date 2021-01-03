
class Veiculo
  attr_accessor :nome, :cor, :marca

  def initialize(nome, marca)
    @nome = nome
    @marca = marca
  end

  def define_cor
    @cor = cor
  end
end

class Carro < Veiculo

  def ligar
    puts "O #{@nome}/#{@marca}: está pronto para inciar o trajeto"
  end

end

class Moto < Veiculo
  def ligar
    puts "A #{@nome}/#{@marca}: está pronto para inciar o trajeto"
  end
end


fusca = Carro.new("Fusca", "VW")
fusca.ligar

palio = Carro.new("Palio", "Fiat")
palio.ligar

cg = Moto.new("CG", "Honda")
cg.ligar