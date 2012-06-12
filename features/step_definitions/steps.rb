# encoding: utf-8

#TODO: start/stop server before/after each test
Given /^somebody named "(.*?)" is at ([\d\.]+)°, ([\d\.]+)°$/ do |name, lat, long|
  require 'rest_client'
  require 'json'
  location = {:lat => lat, :long => long}
  RestClient.put "http://#{SITE}\/#{name}", location.to_json
end

When /^I open "http:\/\/wherewhere\.is\/(.*?)"$/ do |name|
  visit "http://#{SITE}\/#{name}"
end

Then /^I should see a mark at (\d+)\.(\d+)°, (\d+)\.(\d+)°$/ do |arg1, arg2, arg3, arg4|
  # TODO
  page.html.should match(/q=44\.6668250,11\.4927306/)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
