Dado('que estou logado como {string} e {string}') do |email, senha|
  @email =  email
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
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando('submeto o cadastro desse item') do

  imagem = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

  find("#thumbnail input[type=file]", visible: false).set imagem

  find("input[placeholder$=equipamento]").set @anuncio[:nome]
  find("#category").find('option', text: @anuncio[:categoria]).select_option
  find("input[placeholder^=Valor]").set @anuncio[:preco]

  click_button "Cadastrar"
end

Entao('deve ser esse item no meu Dashboard') do
  anuncios = find(".equipo-list")
  expect(anuncios).to have_content @anuncio[:nome]
  expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end

