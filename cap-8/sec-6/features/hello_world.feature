# language: pt

Funcionalidade: Hello World

  @happy_path, @tag_1
  Cenário: Hello world com sucesso
    Quando rodo meu programa de hello world
    Entao ele imprime na tela "hello world"

  @tag_2
  Cenário: Hello world sem sucesso
    Quando rodo meu programa de hello world
    Então ele não imprime na tela o texto "hello world"
