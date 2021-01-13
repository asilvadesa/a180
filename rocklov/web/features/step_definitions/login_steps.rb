Dado('que acesso a página principal') do

  @login_page.open
end

Quando('submeto minhas credenciais de email {string} e senha {string}') do |email, senha|
  @login_page.with(email, senha)
end