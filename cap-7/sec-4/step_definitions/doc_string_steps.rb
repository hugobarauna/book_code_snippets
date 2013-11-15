Quando(/^um visitante faz um cadastro com o nome "(.*?)"$/) do |name|
  @name = name
end

Então(/^ele deve receber um e\-mail de boas vindas com o seguinte texto:$/) do |email_body|
  text = <<-EOF
Olá João da Silva,

Bem vindo ao nosso site. Espero que você tenha uma ótima
experiência aqui.
  EOF
  text.strip!

  expect(text).to eq(email_body)
end
