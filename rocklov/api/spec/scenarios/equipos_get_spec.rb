describe "GET /equipos/{equipos_id}" do
  before(:all) do
    payload = {email: "asilvagit@gmail.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  context "Obtem unico equipo" do
    before(:all) do
      #dado que eu tenho um novo equipamento
      @payload = {
        "thumbnail": Helpers::get_thumbnail("sanfona.jpg"),
        "name": "Sanfona",
        "category": "Outros",
        "price": 499,
      }
      MongoDB.new.remove_equipo(@payload[:name], @user_id)

      #e eu tenho o id desse equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      #quando faço uma requisicao get por id
      @result = Equipos.new.find_by_id(@equipo_id, @user_id)

    end
    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "deve retornar o nome" do
      expect(@result.parsed_response).to include("name" => @payload[:name])
    end
  end

  context "Equipo nao existe" do
    before(:all) do
      @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "deve retornar 404" do
      expect(@result.code).to eql 404
    end
  end
end

describe "GET /equipos" do
  before(:all) do
    payload = {email: "penelope@gmail.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  context "obter uma lista" do
    before(:all) do
      payloads = [
        {
          "thumbnail": Helpers::get_thumbnail("sanfona.jpg"),
          "name": "Sanfona",
          "category": "Outros",
          "price": 499,
        },
        {
          "thumbnail": Helpers::get_thumbnail("pedais.jpg"),
          "name": "Pedais",
          "category": "Outros",
          "price": 599,
        },
        {
          "thumbnail": Helpers::get_thumbnail("conga.jpg"),
          "name": "Conga",
          "category": "Outros",
          "price": 399,
        }
      ]

      payloads.each do |payload|
        MongoDB.new.remove_equipo(payload[:name], @user_id)
        Equipos.new.create(payload, @user_id)
      end
      @result = Equipos.new.list(@user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "deve retornar uma lista" do
      expect(@result.parsed_response).not_to be_empty
    end

  end
end