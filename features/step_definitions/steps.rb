# encoding: utf-8

require 'rest_client'

Before do
  DELETE "/database"
end

Given /^somebody named "(.*?)" is at ([\d\.]+)°, ([\d\.]+)°$/ do |name, lat, long|
  PUT "/#{name}", {:lat => lat, :long => long}
end

Given /^a second later "(.*?)" is at ([\d\.]+)°, ([\d\.]+)°$/ do |name, lat, long|
  PUT "/#{name}", {:lat => lat, :long => long}
end

Given /^it is (\d+):(\d+)$/ do |hours, minutes|
  res = POST "/time", {:hours => hours, :minutes => minutes}
end

When /^I open "http:\/\/wherewhere\.is\/(.*?)"$/ do |name|
  # FIXME: this is the only way I found to fix
  # a very weird error in page status codes when using
  # capybara-webkit. On the first visit, the status
  # code is usually zero or a quirky random number.
  # I have no idea how/why this happens.
  2.times do
    visit "http://localhost:9292/#{name}"
  end
end

Then /^I should see a mark at ([\d\.]+)°, ([\d\.]+)°$/ do |lat, long|
  page.html.should match("q=#{lat},#{long}")
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should get a (\d+) response$/ do |status|
  page.status_code.should == status.to_i
end
