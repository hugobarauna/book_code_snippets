# language: pt

Funcionalidade: Notificação de compra
  Ao usuário realizar uma compra, ele deve receber uma
  notificação por email com os detalhes da sua compra.

  Cenario: Notificação com sucesso
    Dado que estou logado
    Quando eu compro um produto
    Então devo receber um email com os detalhes da compra
