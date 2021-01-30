describe "POST /equipos" do
  before(:all) do
    payload = {email: "asilvagit@gmail.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Novo equipo" do
    before(:all) do

      thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"), "rb")

      payload = {
        "thumbnail": thumbnail,
        "name": "Kramer",
        "category": "Cordas",
        "price": 299
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)
      @result = Equipos.new.create(payload, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
