
describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = {email: "ed@gmail.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @ed_id = result.parsed_response["_id"]
  end

  context "Solicitar locacao" do
    before(:all) do

      # login com usuario joe
      payload = {email: "joe@gmail.com", password: "pwd123"}
      result = Sessions.new.login(payload)
      joe_id = result.parsed_response["_id"]

      # cadastrar novo equipo
      fender = {
        "thumbnail": Helpers::get_thumbnail("fender-sb.jpg"),
        "name": "Fender Strato",
        "category": "Cordas",
        "price": 150
      }
      MongoDB.new.remove_equipo(fender[:name], joe_id)
      result = Equipos.new.create(fender, joe_id)
      @fender_id = result.parsed_response["_id"]

      #Quando solicito a locação da Fender do Joe Perry
      @result = Equipos.new.booking(@fender_id, @ed_id )

    end

    it "deve retonar 200" do
      expect(@result.code).to eql 200
    end
  end
end