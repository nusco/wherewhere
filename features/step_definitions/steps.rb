# encoding: utf-8

Given /^somebody named "(.*?)" sends location (\d+)\.(\d+)°, (\d+)\.(\d+)°$/ do |arg1, arg2, arg3, arg4, arg5|
  # TODO
end

When /^I open "http:\/\/wherewhere\.is\/(.*?)"$/ do |name|
  visit "http://#{SITE}\/#{name}"
end

Then /^I should see a mark at (\d+)\.(\d+)°, (\d+)\.(\d+)°$/ do |arg1, arg2, arg3, arg4|
  # TODO
  page.html.should match(/q\=44\.6668250\,\+011\.4927306/)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
