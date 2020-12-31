#language: pt

Funcionalidade:
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @temp
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais de email "asilvagit@gmail.com" e senha "pwd123"
        Então sou redirecionado para o dashboard

    Cenario: Senha incorreta

        Dado que acesso a página principal
        Quando submeto minhas credenciais com senha incorreta
        Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

    Cenário: Email não cadastrado

        Dado que acesso a página principal
        Quando submeto minhas credenciais com email que não existe na Rocklov
        Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

    Cenario: Email incorreto

        Dado que acesso a página principal
        Quando submeto minhas credenciais com email incorreto
        Então vejo a mensagem de alerta: Oops. Informe um email válido!

    Cenario: Email não informado

        Dado que acesso a página principal
        Quando submeto minhas credenciais sem o email
        Então vejo a mensagem de alerta: Oops. Informe um email válido!

    Cenario: Senha não informada

        Dado que acesso a página principal
        Quando submeto minhas credenciais sem a senha
        Então vejo a mensagem de alerta: ops. Informe sua senha secreta!