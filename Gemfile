source :rubygems

gem "sinatra"
gem "mongo"
gem "bson_ext"
# TODO: is this the right webserver for heroku?
gem "thin"

group :development do
  gem "rake"
end

group :test do
  gem "cucumber"
  gem "capybara-webkit"
  gem "rspec"
  gem "rest-client"
  # this crashes heroku when I move it to the global group. WTF?
  # I need it there to freeze time on the production server
  gem "timecop"
end
