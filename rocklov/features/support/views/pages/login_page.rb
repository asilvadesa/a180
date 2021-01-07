
class LoginPage
  include Capybara::DSL

  def open
    visit "/"
  end

  def with(email, senha)
    find("input[placeholder='Seu email']").set email
    find("input[type=password]").set senha
    click_button "Entrar"
  end
end