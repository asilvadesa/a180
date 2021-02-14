
class DashPage
  include Capybara::DSL

  def goto_equipo_form
    click_button "Criar anúncio"
  end

  def equipo_list
    return find(".equipo-list")
  end

  def has_no_equipo?(name)
    return page.has_no_css?(".equipo-list li", text: name)
  end

  def on_dash?
    return page.has_css?(".dashboard")
  end

  def request_removal(name)
    equipo = find(".equipo-list li", text: name)
    equipo.find(".delete-icon").click
  end

  def confirm_remove
    click_on "Sim"
  end
end