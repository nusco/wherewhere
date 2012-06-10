SITE = ENV['SITE'] || "localhost:5000"

require 'capybara/cucumber'
require 'capybara-webkit'
Capybara.default_driver = :webkit

require './lib/wherewhere'
Capybara.app = WhereWhere.new
