# language: pt

Funcionalidade: Login

  Cenário: Login com sucesso
    Após o visitante logar com sucesso na aplicação, ele deve visualizar uma
    mensagem de boas vindas.

    Dado que um visitante está na home do site
    E ele está deslogado
    Quando ele loga com sucesso
    Então o sistema deve mostrar pra ele uma mensagem de boas vindas
