Before do
  @alert = Alert.new
  @login_page = LoginPage.new
  @singup_page = SingupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new

  page.current_window.resize_to(1440, 900)
end
