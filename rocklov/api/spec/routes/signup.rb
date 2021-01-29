
require "httparty"

class Signup
  include HTTParty
  base_uri "http://rocklov-api:3333"

  def create(payload)

    return self.class.post(
      "/signup",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json"
      }
    )
  end
end
