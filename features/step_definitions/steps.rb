# encoding: utf-8

Given /^somebody named "(.*?)" sends location (\d+)\.(\d+)°, (\d+)\.(\d+)°$/ do |arg1, arg2, arg3, arg4, arg5|
  # TODO
end

When /^I open "http:\/\/wherewhere\.is\/(.*?)"$/ do |name|
  visit "http://#{SITE}\/#{name}"
end

Then /^I should see a mark at (\d+)\.(\d+)°, (\d+)\.(\d+)°$/ do |arg1, arg2, arg3, arg4|
  # TODO
  page.should have_content("q=44.6668250%C2%B0,+011.4927306%C2%B0")
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
