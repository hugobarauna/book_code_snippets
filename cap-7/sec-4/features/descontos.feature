# language: pt

Funcionalidade: Desconto

  Esquema do Cenário: Cálculo de desconto de produto
    O desconto dos produtos da nossa loja são baseados em até
    três variáveis: tipo do produto, preço e quantidade em estoque.

    Dado que um <produto> tem um estoque de <estoque> unidades
    E que esse produto custa <preco> reais
    Então o desconto desse produto deve ser de <desconto> reais

    Exemplos: Desconto para eletrodomésticos
      Um eletrodoméstico deve ter um desconto de 20 reais caso
      tenha tenha mais de 100 unidades em estoque e seu preço seja maior
      que 100 reais.

      | produto   | estoque | preco | desconto |
      | geladeira | 90      | 200   | 0        |
      | geladeira | 150     | 200   | 20       |
      | fogão     | 150     | 70    | 0        |

    Exemplos: Desconto para alimentos
      Um alimento deve ter um desconto de 1 real caso tenha mais
      de 1000 unidades em estoque.

      | produto | estoque | preco | desconto |
      | arroz   | 900     | 5     | 0        |
      | feijão  | 1500    | 3     | 1        |

  Esquema do Cenário: Cálculo de desconto de produto
    O desconto dos produtos da nossa loja são baseados em até
    três variáveis: tipo do produto, preço e quantidade em estoque.

    Dado que um <produto> tem um estoque de <estoque> unidades
    E que esse produto custa <preco> reais
    Então o desconto desse produto deve ser de <desconto> reais

    Exemplos:
      | produto   | estoque | preco | desconto |
      | geladeira | 90      | 200   | 0        |
      | geladeira | 150     | 200   | 20       |
      | fogão     | 150     | 70    | 0        |
      | arroz     | 900     | 5     | 0        |
      | feijão    | 1500    | 3     | 1        |





