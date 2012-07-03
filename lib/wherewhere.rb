require 'sinatra'
require 'json'

class WhereWhere < Sinatra::Base
  configure do
    require 'mongo'
    conn = Mongo::Connection.new("localhost", 27017)
    set :mongo_connection, conn
    set :mongo_db,         conn.db('wherewhere')
  end
  
  # now see http://recipes.sinatrarb.com/p/databases/mongo
  helpers do
    def object_id val
      BSON::ObjectId.from_string(val)
    end

    def document_by_id id
      id = object_id(id) if String === id
      settings.mongo_db['wherewhere'].find_one(:_id => id).to_json
    end
  end
  # remove the crud above ASAP
  
  get '/:name' do
    content_type :json
    location = settings.mongo_db['wherewhere'].find_one(:name => name).to_json
    return [404, {}, "WhereWhere doesn't know where #{user} is"] unless location
    user = location[:user].downcase
    erb :location, :locals => {:user => user, :location => location}
  end

  put '/:name' do
    content_type :json
    puts params
    settings.mongo_db['wherewhere'].insert params
    200
  end
end
