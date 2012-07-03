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
  end
  
  get '/:name' do
    name = params[:name].downcase
    data = locations.find_one(:name => name)
    return [404, {}, "WhereWhere doesn't know where #{name} is"] unless data
    puts data['time'].class
    age = Time.now - data['time']
    puts '>>>>', age, age.class, '>>>>'
    erb :location, :locals => {:data => data, :age => age}
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
  
  # TODO: remove in production!

  delete '/' do
    locations.remove
  end

  put '/time' do
    hours, minutes = params[:hours].to_i, params[:minutes].to_i
    require 'timecop'
    Timecop.freeze Time.local(2012, 9, 1, hours, minutes)
  end
end
