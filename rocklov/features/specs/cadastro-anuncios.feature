#language: pt

Funcionalidade: Cadastro de Anúncios
  Sendo usuários cadastro no RockLov que possui equipamentos musicais
  Quero cadastrar meus equipamentos
  Para que eu possa disponibilizar para locação

  Contexto: Login
    * Login com "asilvagit@gmail.com" e "pwd123"

  Cenario: Novo equipo

    Dado que acesso o formulario de cadastro de anuncios
    E que eu tenha o seguinte equipamento
      | thumb     | fender-sb.jpg |
      | nome      | Fender Strato |
      | categoria | Cordas        |
      | preco     | 200           |

    Quando submeto o cadastro desse item
    Entao deve ser esse item no meu Dashboard

  @temp
  Esquema do Cenario: : Tentavias de login de cadastro de anuncios
    Dado que acesso o formulario de cadastro de anuncios
    E que eu tenha o seguinte equipamento
      | thumb     | <foto>      |
      | nome      | <nome>      |
      | categoria | <categoria> |
      | preco     | <preco>     |

    Quando submeto o cadastro desse item
    Entao deve conter a mensagem "<mensagem_output>"

    Exemplos:
      | foto          | nome          | categoria | preco | mensagem_output                   |
      |               | Ferder Strato | Cordas    | 200   | Adicione uma foto no seu anúncio! |
      | clarinete.jpg |               | Outros    | 150   | Informe a descrição do anúncio!   |
      | violino.jpg   | Violino       |           | 300   | Informe a categoria               |
      | baixo.jpg     | Baixo         | Cordas    |       | Informe o valor da diária         |