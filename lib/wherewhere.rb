require 'sinatra'
require 'json'

class WhereWhere < Sinatra::Base
  USERS = {}

  get '/:name' do
    location = USERS[params[:name].downcase]
    return "WhereWhere doesn't know where #{params[:name]} is" unless location
    erb :location, :locals => {:location => location}
  end

  put '/:name' do
    USERS[params[:name].downcase] = JSON.parse request.body.read
    200
  end
end
