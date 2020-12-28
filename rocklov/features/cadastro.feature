#language: pt
    Funcionalidade: Cadastro
        Sendo um músico que possui equipamentos musicais
        Quero fazer o meu cadastro no RockLov
        Para que eu possa disponibilizá-los para locação

        @cadastro
        Cenario: Fazer cadastro

            Dado que acesso a pagina de cadastro
            Quando submeto o meu cadastro completo
            Então sou redirecionado para o dashboard

        @tentativa_cadastro
        Cenário: Submeter cadastro sem o nome

            Dado que acesso a pagina de cadastro
            Quando submeto o meu cadastro sem o nome
            Então vejo a mensagem de alerta: Oops. Informe seu nome completo!

        @tentativa_cadastro
        Cenário: Submeter cadastro sem o email

            Dado que acesso a pagina de cadastro
            Quando submeto o meu cadastro sem o email
            Então vejo a mensagem de alerta: Oops. Informe um email válido!

        @tentativa_cadastro
        Cenário: Submeter cadastro com email incorreto

            Dado que acesso a pagina de cadastro
            Quando submeto o meu cadastro com email incorreto
            Então vejo a mensagem de alerta: Oops. Informe um email válido!

        @tentativa_cadastro
        Cenário: Submeter cadastro sem senha

            Dado que acesso a pagina de cadastro
            Quando submeto o meu cadastro sem a senha
            Então vejo a mensagem de alerta: Oops: Informe sua senha secreta!