SITE = ENV['SITE'] || "localhost:9292"

require 'capybara/cucumber'
require 'capybara-webkit'
# this silences the Webkit JS warnings by redirecting them to nil:
Capybara.register_driver :webkit do |app|
  Capybara::Driver::Webkit.new(app, :stdout => nil)
end
Capybara.default_driver = :webkit

require './lib/wherewhere'
Capybara.app = WhereWhere.new
