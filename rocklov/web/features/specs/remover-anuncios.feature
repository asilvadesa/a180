#language: pt

  Funcionalidade: Remover anuncios
    Sendo um anunciante que possui um equipamanto indesejado
    Quero poder remover esse anuncio
    Para que eu possa manter o meu Dashboard atualizado

    Contexto: Login
      * Login com "spider@gmail.com" e "pwd123"

    @remover_anuncio
    Cenario: Remover um anuncio

      Dado que eu tenha um anuncio indesejado
        | thumb     | telecaster.jpg |
        | nome      | Telecaster     |
        | categoria | Cordas         |
        | preco     | 50             |

      Quando eu solicito a exclusão desse item
      E confirmo a exclusão
      Entao nao devo ver esse item no meu Dashboard

    @desistir
    Cenario: Desistir da exclusao

      Dado que eu tenha um anuncio indesejado
        | thumb     | conga.jpg |
        | nome      | Conga     |
        | categoria | Outros    |
        | preco     | 100       |

      Quando eu solicito a exclusão desse item
      Mas não confirmo a exclusão
      Entao esse item deve permanecer no meu Dashboard