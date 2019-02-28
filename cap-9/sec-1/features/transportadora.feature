# language: pt

Funcionalidade: Processo de compra

  Cenário: sistema da transportadora está fora ar
    Se o sistema da transportadora estiver fora do ar, então não
    deve ser possível fazer compras.

    Dado que o sistema da transportadora está fora do ar
    Quando tento fazer uma compra normal
    Então recebo uma mensagem de erro
