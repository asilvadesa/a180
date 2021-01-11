Dado('Login com {string} e {string}') do |email, senha|
  @email =  email
  @login_page.open
  @login_page.with(email, senha)
end

Dado('que acesso o formulario de cadastro de anuncios') do
  @dash_page.goto_equipo_form
end

Dado('que eu tenha o seguinte equipamento') do |table|
  @anuncio = table.rows_hash
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando('submeto o cadastro desse item') do
  @equipos_page.create(@anuncio)
end

Entao('deve ser esse item no meu Dashboard') do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Entao('deve conter a mensagem {string}') do |alert_expect|
  expect(@alert.dark).to have_text alert_expect
end
