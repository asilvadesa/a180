Então('sou redirecionado para o dashboard') do
  expect(@dash_page.on_dash?).to be true
end

Então('vejo a mensagem de alerta: {string}') do |alert_expect|
  expect(@alert.dark).to eql alert_expect
end
