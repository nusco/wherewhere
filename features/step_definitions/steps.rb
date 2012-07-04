# encoding: utf-8

Before do
  require 'rest_client'
  RestClient.delete "http://localhost:4567/database"
end

#TODO: start/stop server before/after each test
Given /^somebody named "(.*?)" is at ([\d\.]+)°, ([\d\.]+)°$/ do |name, lat, long|
  RestClient.put "http://localhost:4567/#{name}", {:lat => lat, :long => long}
end

Given /^a second later "(.*?)" is at ([\d\.]+)°, ([\d\.]+)°$/ do |name, lat, long|
  RestClient.put "http://localhost:4567/#{name}", {:lat => lat, :long => long}
end

Given /^it is (\d+):(\d+)$/ do |hours, minutes|
  res = RestClient.post "http://localhost:4567/time", {:hours => hours, :minutes => minutes}
end

When /^I open "http:\/\/wherewhere\.is\/(.*?)"$/ do |name|
  # FIXME: this is the only way I found to fix
  # a very weird error in page status codes when using
  # capybara-webkit. On the first visit, the status
  # code is usually zero or a quirky random number.
  # I have no idea how/why this happens.
  2.times do
    visit "http://localhost:4567/#{name}"
  end
end

Then /^I should see a mark at (\d+)\.(\d+)°, (\d+)\.(\d+)°$/ do |arg1, arg2, arg3, arg4|
  # TODO
  page.html.should match(/q=44\.6668250,11\.4927306/)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should get a (\d+) response$/ do |status|
  page.status_code.should == status.to_i
end
