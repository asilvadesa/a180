Dado('que estou logado como {string} e {string}') do |email, senha|
  visit "/"
  find("input[placeholder='Seu e-email']").set email
  find("input[type=password]").set senha
  click_button "Entrar"

end

Dado('que acesso o formulario de cadastro de anuncios') do
  click_button "Criar anúncio"

end


Dado('que eu tenha o seguinte equipamento') do |table|
  @anuncio = table.rows_hash
end

Quando('submeto o cadastro desse item') do

  imagem = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

  find("#thumbnail input[type=file]", visible: false).set imagem

  find("input[placeholder$=equipamento]").set @anuncio[:nome]
  find("#category").find('option', text: @anuncio[:categoria]).select_option
  find("input[placeholder^=Valor]").set @anuncio[:preco]

  #click_button "Cadastrar"
  sleep 10
end

Entao('deve ser esse item no meu Dashboard') do
  pending # Write code here that turns the phrase above into concrete actions
end

