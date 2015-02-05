require 'shouty'
require 'rspec'

Before do
  @people = {}
  @locations = {}
  @shout_server = ShoutServer.new
end

Given(/^"(.*?)" is at geo location (.*?),(.*?)$/) do |location, lat, long|
  @locations[location] = [lat.to_f, long.to_f]
end

Given(/^(\w+) is in "(.*?)"$/) do |person_name, location|
  person = Person.new(@shout_server)
  person.geo_location = @locations[location]
  @people[person_name] = person
end

When(/^(\w+) shouts "(.*?)"$/) do |person_name, message|
  @the_message = message
  @people[person_name].shout(message)
end

Then(/^(\w+) should not hear the message$/) do |person_name|
  expect(@people[person_name].heard_messages).to eq([])
end

Then(/^(\w+) should hear the message$/) do |person_name|
  expected_messages = [@the_message]
  expect(@people[person_name].heard_messages).to eq(expected_messages)
end
