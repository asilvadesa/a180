require_relative "routes/sessions"

describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = {email: "asilvagit@gmail.com", password: "pwd123"}
      @result = Sessions.new.login(payload)
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
      title: "senha invalida",
      payload: {email: "asilvagit@gmail.com", password: "123456"},
      code: 401,
      error: "Unauthorized"

    },
    {
      title: "email invalido",
      payload: {email: "404@gmail.com", password: "123456"},
      code: 401,
      error: "Unauthorized"

    },
    {
      title: "campo email branco",
      payload: {email: "", password: "123456"},
      code: 412,
      error: "required email"

    },
    {
      title: "sem campo email",
      payload: {password: "123456"},
      code: 412,
      error: "required email"

    },
    {
      title: "senha em branco",
      payload: {email: "asilvagit@gmail.com", password: ""},
      code: 412,
      error: "required password"

    },
    {
      title: "sem campo senha",
      payload: {email: "asilvagit@gmail.com"},
      code: 412,
      error: "required password"

    }
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
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
