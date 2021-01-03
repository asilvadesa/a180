Dado('que acesso a página principal') do
  visit "/"
end

Quando('submeto minhas credenciais de email {string} e senha {string}') do |email, senha|
  find("input[placeholder='Seu email']").set email
  find("input[type=password]").set senha
  click_button "Entrar"
end