require 'shouty'

LOCATIONS = {
  "Leeds Stadium" => [53.777816,-1.572145]
}

Before do
  @shouty = Shouty.new
end

Given(/^"([^"]*)" is in "([^"]*)"$/) do |person_name, location_name|
  geo_location = LOCATIONS[location_name]
  @shouty.person_is_in(person_name, geo_location)
end

When(/^"([^"]*)" sends a message$/) do |person_name|
  @shouty.person_sends_a_message(person_name, "hello")
end

Then(/^"([^"]*)" should not receive the message$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
