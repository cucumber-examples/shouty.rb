require 'shouty'
require 'rspec'

Before do
  @people = {}
  @locations = {}
  @shout_server = ShoutServer.new
end

Given(/^the following geo locations:$/) do |locations|
  locations.hashes.each do |name_lat_long|
    location = name_lat_long['name']
    lat      = name_lat_long['lat']
    long     = name_lat_long['long']
    @locations[location] = [lat.to_f, long.to_f]
  end
end

Given(/^(\w+) is in (.*?)$/) do |person_name, location|
  person = Person.new(person_name, @shout_server)
  person.geo_location = @locations[location]
  @people[person_name] = person
end

When(/^(\w+) shouts "(.*?)"$/) do |person_name, message|
  @the_message = message
  @people[person_name].shout(message)
end

When(/^(\w+) shouts:$/) do |person_name, message|
  @the_message = message
  @people[person_name].shout(message)
end

Then(/^(\w+) should not hear the message$/) do |person_name|
  expect(@people[person_name].heard_messages).to eq([])
end

Then(/^(\w+) should not hear any messages$/) do |person_name|
  expect(@people[person_name].heard_messages).to eq([])
end


Then(/^(\w+) should hear the message$/) do |person_name|
  expected_messages = [@the_message]
  expect(@people[person_name].heard_messages).to eq(expected_messages)
end

Then(/^(\w+) sees that the message is from (\w+)$/) do |listener_name, shouter_name|
  expected_shout = @people[listener_name].heard_shouts[0]
  expect(expected_shout.shouter_name).to eq(shouter_name)
end
