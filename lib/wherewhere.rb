require 'sinatra'

class WhereWhere < Sinatra::Base

  TRACKED_USERS = {}

  get '/:name' do
    return "WhereWhere doesn't know where #{params[:name]} is" unless TRACKED_USERS[params[:name].downcase]
    erb :location
  end

  put '/:name' do |data|
    TRACKED_USERS[params[:name].downcase] = data
  end
end
