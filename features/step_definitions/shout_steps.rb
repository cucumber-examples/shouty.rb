World do
  case ENV['WORLD']
  when 'web'
    WebWorld.new
  else
    require 'shouty'
    Shouty.new
  end
end

Given(/^the following locations:$/) do |locations_table|
  @locations = {}
  locations_table.hashes.each do |location|
    location_name = location['location_name']
    lat           = location['lat'].to_f
    lon           = location['lon'].to_f
    @locations[location_name] = [lat, lon]
  end
end

Given(/^"([^"]*)" is in "([^"]*)"$/) do |person_name, location_name|
  geo_location = @locations[location_name]
  person_is_in(person_name, geo_location)
end

Given(/^"([^"]*)" is in any location$/) do |person_name|
  geo_location = @locations['Heathrow Terminal 5']
  person_is_in(person_name, geo_location)
end

When(/^"([^"]*)" shouts "(.*)"$/) do |person_name, message|
  @shouted_message = message
  person_shouts(person_name, message)
end

Then(/^"([^"]*)" should not receive the message$/) do |person_name|
  # rspec
  expect(messages_heard_by(person_name)).to eq([])
end

Then(/^"([^"]*)" should receive the message$/) do |person_name|
  # rspec
  expect(messages_heard_by(person_name)).to eq([@shouted_message])
end
