Quando("um visitante faz um cadastro com o nome {string}") do |name|
  @name = name
end

Então("ele recebe um email com o seguinte texto:") do |email_body|
  text = <<~EOF.chomp
    Olá João da Silva,

    Bem vindo ao nosso site. Espero que você tenha uma ótima
    experiência aqui.
  EOF
  expect(text).to eq(email_body)
end
