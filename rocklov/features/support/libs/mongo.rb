require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

  def remove_user(email)
    client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
    users_collection = client[:users]
    users_collection.delete_many({email: email})
  end
end


