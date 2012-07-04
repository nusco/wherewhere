require 'sinatra'

class WhereWhere < Sinatra::Base
  configure do
    require 'mongo'
    if(ENV['MONGOHQ_URL'])
      require 'uri'
      conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
      db = conn.db(URI.parse(ENV['MONGOHQ_URL']).path.gsub(/^\//, ''))
    else
      conn = Mongo::Connection.new('localhost')
      db = conn.db('wherewhere')
    end
    set :mongo_connection, conn
    set :mongo_db,         db
  end
  
  helpers do
    def locations
      settings.mongo_db['locations']
    end
    
    def four_o_four
      [404, {}, "WhereWhere doesn't know where #{params[:name].downcase} is"]
    end
  end
  
  get '/:name' do
    name = params[:name].downcase
    data = locations.find_one(:name => name)
    return four_o_four unless data
    age_mins = ((Time.now - data['time']) / 60).round
    return four_o_four if age_mins >= 60
    erb :location, :locals => { :data => data, :age_mins => age_mins }
  end

  put '/:name' do
    name = params[:name].downcase
    data = {:name => name, :lat => params[:lat], :long => params[:long], :time => Time.now}
    existing = locations.find_one(:name => name)
    if existing
      locations.update({:_id => existing['id']}, data)
    else
      locations.insert data
    end
    200
  end
end
