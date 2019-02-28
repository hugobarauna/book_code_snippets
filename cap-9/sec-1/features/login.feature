# language: pt

Funcionalidade: Login
  Para utilizar o meu sistema
  Como um visitante
  Quero fazer login no sistema

  Contexto:
    * existe um usuário cadastrado com a seguinte credencial:
      | login       | senha  |
      | hugobarauna | 123456 |

  Cenário: Login com sucesso
    Dado que estou na página de login
    Quando preencho o campo "Login" com "hugobarauna"
    E preencho o campo "Senha" com "123456"
    E clico no botão "Logar"
    Então eu vejo uma mensagem de sucesso

  Cenário: Login com senha errada
    Dado que estou na página de login
    Quando preencho o campo "Login" com "hugobarauna"
    E preencho o campo "Senha" com "senha errada"
    E clico no botão "Logar"
    Então eu vejo uma mensagem de erro com o seguinte text:
      """
      Login ou senha estão errados
      """
