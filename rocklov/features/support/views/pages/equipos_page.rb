class EquiposPage
  include Capybara::DSL

  def create(equipo)
    # checkpoint com timeout explícito
    page.has_css?("#equipoForm")

    imagem = Dir.pwd + "/features/support/fixtures/images/" + equipo[:thumb]

    find("#thumbnail input[type=file]", visible: false).set imagem

    find("input[placeholder$=equipamento]").set equipo[:nome]
    find("#category").find('option', text: equipo[:categoria]).select_option
    find("input[placeholder^=Valor]").set equipo[:preco]

    click_button "Cadastrar"
  end
end
