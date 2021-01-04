Dado('que acesso a página principal') do
  visit "/"
end

Quando('submeto minhas credenciais de email {string} e senha {string}') do |email, senha|
  login_page = LoginPage.new
  login_page.open
  login_page.with(email, senha)
end