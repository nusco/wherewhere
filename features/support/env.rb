require 'bundler/setup'

require 'capybara/cucumber'
require 'capybara-webkit'
# this silences the Webkit JS warnings by redirecting them to nil:
Capybara.register_driver :webkit do |app|
  Capybara::Driver::Webkit.new(app, :stdout => nil)
end
Capybara.default_driver = :webkit

require 'rest_client'
Kernel.class_eval do
  [:GET, :POST, :PUT, :DELETE].each do |verb|
    define_method verb do |path, *args|
      RestClient.send verb.downcase, "http://localhost:9292#{path}", *args
    end
  end
end
