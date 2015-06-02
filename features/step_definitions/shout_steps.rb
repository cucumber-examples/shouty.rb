require 'shouty'

LOCATIONS = {
  "Leeds Stadium" => [53.777816,-1.572145]
}

Given(/^"([^"]*)" is in "([^"]*)"$/) do |person_name, location_name|
  person = Person.new
  person.name = person_name
  person.geo_location = LOCATIONS[location_name]
end

When(/^"([^"]*)" sends a message$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^"([^"]*)" should not receive the message$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
