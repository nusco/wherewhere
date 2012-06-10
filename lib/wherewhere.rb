require 'sinatra'

class WhereWhere < Sinatra::Base
  get '/:name' do
    File.read(File.join('public', 'location.html'))
    #"WhereWhere doesn't know where unknown_person is"
  end
end
