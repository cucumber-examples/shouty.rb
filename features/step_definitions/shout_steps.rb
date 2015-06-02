require 'shouty'

LOCATIONS = {
  "Leeds Stadium" => [53.777816,-1.572145]
}

Given(/^"([^"]*)" is in "([^"]*)"$/) do |person_name, location_name|
  shouty = Shouty.new
  shouty.person_is_in(person_name, location_name)
end

When(/^"([^"]*)" sends a message$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^"([^"]*)" should not receive the message$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
