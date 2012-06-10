require 'sinatra'

class WhereWhere < Sinatra::Base
  get '/:name' do
    erb :location
    #"WhereWhere doesn't know where unknown_person is"
  end
end
