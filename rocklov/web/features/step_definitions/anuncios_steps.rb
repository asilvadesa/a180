Dado('Login com {string} e {string}') do |email, senha|
  @email =  email
  @login_page.open
  @login_page.with(email, senha)

  #checkpoint para garantir que estamos no dashboard
  expect(@dash_page.on_dash?).to be true
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

Entao('deve ver esse item no meu Dashboard') do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Entao('deve conter a mensagem {string}') do |alert_expect|
  expect(@alert.dark).to have_text alert_expect
end

# Remover anuncios

Dado('que eu tenha um anuncio indesejado') do |table|

  user_id = page.execute_script("return localStorage.getItem('user')")
  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }
  EquiposService.new.create(@equipo, user_id)

  # refresh (F5)
  visit current_path
end

Quando('eu solicito a exclusão desse item') do
  @dash_page.request_removal(@equipo[:name])
  sleep 1 #think time
end

Quando('confirmo a exclusão') do
  @dash_page.confirm_remove
end

Entao('nao devo ver esse item no meu Dashboard') do
  expect(@dash_page.has_no_equipo?(@equipo[:name])).to be true
end

# Desistir Remover

Quando('não confirmo a exclusão') do
  @dash_page.cancel_remove
end

Entao('esse item deve permanecer no meu Dashboard') do
  expect(@dash_page.equipo_list).to have_content @equipo[:name]
end