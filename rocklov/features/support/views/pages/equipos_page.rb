class EquiposPage
  include Capybara::DSL

  def create(equipo)
    # checkpoint com timeout explícito
    page.has_css?("#equipoForm")

    upload(equipo[:thumb]) if equipo[:thumb].length > 0

    find("input[placeholder$=equipamento]").set equipo[:nome]
    select_opt(equipo[:categoria]) if equipo[:categoria].length > 0
    find("input[placeholder^=Valor]").set equipo[:preco]

    click_button "Cadastrar"
  end

  def upload(file_name)
    imagem = Dir.pwd + "/features/support/fixtures/images/" + file_name
    find("#thumbnail input[type=file]", visible: false).set imagem
  end

  def select_opt(categoria)
    find("#category").find('option', text: categoria).select_option
  end

end
