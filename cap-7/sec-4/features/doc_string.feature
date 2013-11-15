# language: pt

Funcionalidade: Doc string

  Cenário: Cadastro com sucesso
    Quando um visitante faz um cadastro com o nome "João da Silva"
    Então ele deve receber um e-mail de boas vindas com o seguinte texto:
      """
      Olá João da Silva,

      Bem vindo ao nosso site. Espero que você tenha uma ótima
      experiência aqui.
      """
