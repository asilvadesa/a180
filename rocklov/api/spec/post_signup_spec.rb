require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /signup" do
  context "Novo usuario" do
    before(:all) do
      payload = {"name": "Pitty", "email": "pitty@bol.com.br", "password": "pwd123"}
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it 'valida id do usuario' do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  examples = [
    {
      title: "Usuario ja existe",
      payload: {name: "Betao", email: "betao@ig.com.br", password: "pwd123"},
      code: 409,
      error: "Email already exists :("
    },
    {
      title: "Nome Vazio",
      payload: {name: "", email: "betao@ig.com.br", password: "pwd123"},
      code: 412,
      error: "required name"
    },
    {
      title: "Email vazio",
      payload: {name: "Betao", email: "", password: "pwd123"},
      code: 412,
      error: "required email"
    },{
      title: "Senha Vazia",
      payload: {name: "Betao", email: "betao@ig.com.br", password: ""},
      code: 412,
      error: "required password"
    }
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        email = e[:payload]
        MongoDB.new.remove_user(email[:email])
        Signup.new.create(e[:payload])
        @result = Signup.new.create(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it 'valida id do usuario' do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end