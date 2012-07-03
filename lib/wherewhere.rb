require 'sinatra'
require 'json'

class WhereWhere < Sinatra::Base
  USERS = {}

  get '/:name' do
    user = params[:name].downcase
    location = USERS[user]
    return [404, {}, "WhereWhere doesn't know where #{user} is"] unless location
    erb :location, :locals => {:user => user, :location => location}
  end

  put '/:name' do
    USERS[params[:name].downcase] = JSON.parse request.body.read
    200
  end
end
