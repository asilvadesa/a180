

Dado('que acesso a pagina de cadastro') do
  @singup_page.open
end

Quando('submeto o seguinte formulario de cadastro') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  user = table.hashes.first
  MongoDB.new.remove_user(user[:email])
  @singup_page.create(user)
end




