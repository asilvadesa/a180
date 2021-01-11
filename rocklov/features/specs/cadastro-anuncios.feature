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
      | thumb      | fender-sb.jpg |
      | nome       | Fender Strato |
      | categoria  | Cordas        |
      | preco      | 200           |

    Quando submeto o cadastro desse item
    Entao deve ser esse item no meu Dashboard