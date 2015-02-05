require 'shouty'
require 'rspec'

Before do
  @locations = {}
  @shout_server = ShoutServer.new
end

Given(/^"(.*?)" is at geo location (.*?),(.*?)$/) do |location, lat, long|
  @locations[location] = [lat.to_f, long.to_f]
end

Given(/^Elizabeth is in "(.*?)"$/) do |location|
  @elizabeth = Person.new(@shout_server)
  @elizabeth.geo_location = @locations[location]
end

Given(/^Charles is in "(.*?)"$/) do |location|
  @charles = Person.new(@shout_server)
  @charles.geo_location = @locations[location]
end

When(/^Elizabeth shouts "(.*?)"$/) do |message|
  @the_message = message
  @elizabeth.shout(message)
end

Then(/^Charles should not hear the message$/) do
  expect(@charles.heard_messages).to eq([])
end

Then(/^Charles should hear the message$/) do
  expected_messages = [@the_message]
  expect(@charles.heard_messages).to eq(expected_messages)
end
