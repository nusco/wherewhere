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
  
  get '/:name' do
    name = params[:name].downcase
    data = settings.mongo_db['locations'].find_one(:name => name)
    return [404, {}, "WhereWhere doesn't know where #{name} is"] unless data
    erb :location, :locals => {:name => name, :lat => data["lat"], :long => data["long"]}
  end

  put '/:name' do
    # TODO: check for name existing and update
    data = {:name => params[:name], :lat => params[:lat], :long => params[:long]}
    settings.mongo_db['locations'].insert data
  end
  
  # TODO: remove in production!
  delete '/' do
    settings.mongo_db['locations'].remove
  end
end
