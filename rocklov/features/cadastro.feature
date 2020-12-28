#language: pt
    Funcionalidade: Cadastro
        Sendo um músico que possui equipamentos musicais
        Quero fazer o meu cadastro no RockLov
        Para que eu possa disponibilizá-los para locação

        @cadastro
        Cenario: Fazer cadastro com sucesso

            Dado que acesso a pagina de cadastro
            Quando submeto o seguinte formulario de cadastro
                |       nome      |         email        | senha  |
                | Anderson Silva  | asilvadesa@gmail.com | pwd123 |
            Então sou redirecionado para o dashboard

        @tentativa_cadastro
        Cenário: Submeter cadastro sem o nome

            Dado que acesso a pagina de cadastro
            Quando submeto o seguinte formulario de cadastro
                |       nome      |         email        | senha  |
                |                 | asilvadesa@gmail.com | pwd123 |
            Então vejo a mensagem de alerta: "Oops. Informe seu nome completo!"

        @tentativa_cadastro
        Cenário: Submeter cadastro sem o email

            Dado que acesso a pagina de cadastro
            Quando submeto o seguinte formulario de cadastro
                |       nome      |         email        | senha  |
                | Anderson Silva  |                      | pwd123 |
            Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

        @tentativa_cadastro
        Cenário: Submeter cadastro com email incorreto

            Dado que acesso a pagina de cadastro
            Quando submeto o seguinte formulario de cadastro
                |       nome      |         email        | senha  |
                | Anderson Silva  | asilvadesa*gmail.com | pwd123 |
            Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

        @tentativa_cadastro
        Cenário: Submeter cadastro sem senha

            Dado que acesso a pagina de cadastro
            Quando submeto o seguinte formulario de cadastro
                |       nome      |         email        | senha  |
                | Anderson Silva  | asilvadesa@gmail.com |        |
            Então vejo a mensagem de alerta: "Oops. Informe sua senha secreta!"