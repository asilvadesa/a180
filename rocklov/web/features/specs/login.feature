#language: pt

Funcionalidade:
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais de email "asilvagit@gmail.com" e senha "pwd123"
        Então sou redirecionado para o dashboard

    Esquema do Cenario: Logins invalidos

        Dado que acesso a página principal
        Quando submeto minhas credenciais de email "<email_input>" e senha "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input         | senha_input | mensagem_output                  |
            | asilvagit@gmail.com | abc123      | Usuário e/ou senha inválidos.    |
            | asilvagit@yahoo.com | abc123      | Usuário e/ou senha inválidos.    |
            | asilvagit&yahoo.com | abc123      | Oops. Informe um email válido!   |
            |                     | abc123      | Oops. Informe um email válido!   |
            | asilvagit@yahoo.com |             | Oops. Informe sua senha secreta! |
