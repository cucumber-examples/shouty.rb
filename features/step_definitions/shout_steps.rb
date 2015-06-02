require 'shouty'

LOCATIONS = {
  "Leeds Stadium"     => [53.777816,-1.572145],
  "Osterley Tube"     => [51.481358,-0.350519],
  "Westminster Abbey" => [51.499292,-0.12731]
}

Before do
  @shouty = Shouty.new
end

Given(/^"([^"]*)" is in "([^"]*)"$/) do |person_name, location_name|
  geo_location = LOCATIONS[location_name]
  @shouty.person_is_in(person_name, geo_location)
end

When(/^"([^"]*)" shouts "(.*)"$/) do |person_name, message|
  @shouted_message = message
  @shouty.person_sends_a_message(person_name, message)
end

Then(/^"([^"]*)" should not receive the message$/) do |person_name|
  # rspec
  expect(@shouty.messages_heard_by(person_name)).to eq([])
end

Then(/^"([^"]*)" should receive the message$/) do |person_name|
  # rspec
  expect(@shouty.messages_heard_by(person_name)).to eq([@shouted_message])
end
