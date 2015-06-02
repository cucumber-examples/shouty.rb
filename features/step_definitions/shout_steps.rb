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

Then(/^"([^"]*)" should not receive the message$/) do |person_name|
  actual_messages_heard = @shouty.messages_heard_by(person_name) # Array
  expected_messages_heard = []

  if(actual_messages_heard != expected_messages_heard)
    raise "Expected #{expected_messages_heard}, but got #{actual_messages_heard}"
  end
end

Then(/^"([^"]*)" should receive the message$/) do |person_name|
  actual_messages_heard = @shouty.messages_heard_by(person_name) # Array
  expected_messages_heard = ["hello"]

  if(actual_messages_heard != expected_messages_heard)
    raise "Expected #{expected_messages_heard}, but got #{actual_messages_heard}"
  end
end
