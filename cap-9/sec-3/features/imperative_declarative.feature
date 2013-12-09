# language: pt

Funcionalidade: Login

  Cenário: Login com sucesso (imperativo)
    Após o visitante logar com sucesso na aplicação, ele deve visualizar
    uma mensagem de boas vindas.

    Dado que existe um usuário "user@example.org" com a senha "123456"
    Quando ele visita a página de login
    E preenche o campo "E-mail" com "user@example.org"
    E preenche o campo "Senha" com "123456"
    E clica no botão "Logar"
    Então o sistema deve mostrar para ele a seguinte mensagem:
      """
      Bem vindo user@example.org
      """

  Cenário: Login com sucesso (declarativo)
    Após o visitante logar com sucesso na aplicação, ele deve visualizar
    uma mensagem de boas vindas.

    Quando um visitante loga na aplicação
    Então o sistema deve mostrar pra ele uma mensagem de sucesso
