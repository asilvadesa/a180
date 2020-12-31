Então('sou redirecionado para o dashboard') do
  expect(page).to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |alert_expect|
  alert = find(".alert-dark")
  expect(alert.text).to eql alert_expect
end
