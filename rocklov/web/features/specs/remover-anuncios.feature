#language: pt

  Funcionalidade: Remover anuncios
    Sendo um anunciante que possui um equipamanto indesejado
    Quero poder remover esse anuncio
    Para que eu possa manter o meu Dashboard atualizado

    Cenario: Remover um anuncio

      Dado que eu tenha um anuncio indesejado
        | thumb     | telecaster.jpg |
        | nome      | Telecaster     |
        | categoria | Cordas         |
        | preco     | 50             |

      Quando eu solicito a exclusão desse item
      E confirmo a exclusão
      Entao nao devo ver esse item no meu Dashboard

    Cenario: Desistir da exclusao

      Dado que eu tenha um anuncio indesejado
        | thumb     | telecaster.jpg |
        | nome      | Telecaster     |
        | categoria | Cordas         |
        | preco     | 50             |

      Quando eu solicito a exclusão desse item
      Mas não confirmo a exclusão
      Entao devo ver esse item no meu Dashboard