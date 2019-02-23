# language: pt

Funcionalidade: Soma
  Cenário: Soma de 1 + 1
    Quando somo 1 + 1
    Então o resultado é 2

  Cenário: Soma de 2 + 3
    Quando somo 2 + 3
    Então o resultado é 5

  Cenário: Soma de 4 + 3
    Quando somo 4 + 3
    Então o resultado é 7

  Esquema do Cenário: Soma de dois números
    Quando somo <a> + <b>
    Então o resultado deve ser <resultado>

    Exemplos:
      | a | b | resultado |
      | 1 | 1 | 2         |
      | 2 | 3 | 5         |
      | 4 | 3 | 7         |
