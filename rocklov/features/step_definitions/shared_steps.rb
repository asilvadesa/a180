Então('sou redirecionado para o dashboard') do
  expect(page).to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |alert_expect|
  expect(@alert.dark).to eql alert_expect
end
