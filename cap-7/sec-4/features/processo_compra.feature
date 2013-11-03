# language: pt

Funcionalidade: Processo de compra

  Contexto:
    Dado que estou logado

  Cenário: compra normal
    Uma compra normal quer dizer comprar qualquer produto do nosso site
    que não seja caneca.

    Quando faço uma compra normal
    Então recebo uma mensagem de sucesso

  Cenário: compra com desconto
    Compra com desconto é quando alguém compra uma ou mais canecas.

    Quando compro uma caneca
    Então recebo um aviso dizendo que ganhei um desconto

  Cenário: sistema da transportadora está fora ar
    Se o sistema da transportadora estiver fora do ar, então não deve
    ser possível fazer compras.

    Dado que o sistema da transportadora está fora do ar
    Quando tento fazer uma compra normal
    Então recebo uma mensagem de erro
