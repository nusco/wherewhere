require './lib/wherewhere'

WhereWhere.class_eval do
  delete '/database' do
    locations.remove
    200
  end

  # TODO: now understand why the heck this doesn't work with a PUT
  post '/time' do
    require 'timecop'
    Timecop.freeze Time.local(2010, 9, 1, params[:hours].to_i, params[:minutes].to_i)
    200
  end
end
