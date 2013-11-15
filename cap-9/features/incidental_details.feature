# language: pt

Funcionalidade: Notificação de compra
  Ao usuário realizar uma compra, ele deve receber uma notificacão
  por email com os detalhes da sua compra.

  Contexto:
    * existe um cadastro de usuario com os seguintes dados:
      | email                  | senha   |
      | hugo.barauna@gmail.com | abcdefg |

  Cenario: Notificação com sucesso
    Dado que estou logado com as seguintes credenciais:
      | email                  | senha   |
      | hugo.barauna@gmail.com | abcdefg |
    Quando eu compro o produto "macbook pro"
    Então devo receber um email com os detalhes da compra
