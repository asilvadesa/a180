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

        Esquema do Cenario: Tentativas de cadastro
            Dado que acesso a pagina de cadastro
            Quando submeto o seguinte formulario de cadastro
                |       nome      |     email     |     senha     |
                |   <nome_input>  | <email_input> | <senha_input> |
            Então vejo a mensagem de alerta: "<mensagem_output>"

            Exemplos:
            |    nome_input   |      email_input     | senha_input |         mensagem_output          |
            |                 | asilvadesa@gmail.com |    pwd123   | Oops. Informe seu nome completo! |
            | Anderson Silva  |                      |    pwd123   | Oops. Informe um email válido!   |
            | Anderson Silva  | asilvadesa*gmail.com |    pwd123   | Oops. Informe um email válido!   |
            | Anderson Silva  | asilvadesa@gmail.com |             | Oops. Informe sua senha secreta! |