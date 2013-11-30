# language: pt

@tag_1
Funcionalidade: Hello World

  @tag_2 @happy_path
  Cenário: Hello world com sucesso
    Quando rodo meu programa de hello world
    Entao ele imprime na tela "hello world"

  Cenário: Hello world sem sucesso
    Dado que meu programa de hello world está com um erro de sintaxe
    Quando eu rodo ele
    Então ele não imprime na tela o texto "hello world"
