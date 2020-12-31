

Dado('que acesso a pagina de cadastro') do
  visit "http://rocklov-web:3000/signup"
end

Quando('submeto o seguinte formulario de cadastro') do |table|
  # table is a Cucumber::MultilineArgument::DataTable

  user = table.hashes.first

  MongoDB.new.remove_user(user[:email])

  find("#fullName").set user[:nome]
  find("#email").set user[:email]
  find("#password").set user[:senha]

  click_button "Cadastrar"
end

Então('vejo a mensagem de alerta: {string}') do |alert_expect|
  alert = find(".alert-dark")
  expect(alert.text).to eql alert_expect
end



