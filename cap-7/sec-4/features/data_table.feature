# language: pt

Funcionalidade: Data table

  Cenário: tabela simples
    Dado que existe o seguinte cadastro de usuário:
      | nome                   | idade |
      | Hugo Pessoa de Baraúna | 27    |

  Cenário: multiplicação de matrizes
    Dado que tenho a matriz A:
      | 1 | 2 |
      | 3 | 4 |
    E que tenho a matriz B:
      | 5 | 6 |
      | 7 | 8 |
    Quando multiplico a matriz A com a matriz B
    Então o resultado é:
      | 19 | 22 |
      | 43 | 50 |
