require 'rspec'

Before do
  @browsers = {}
  @locations = {}
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
  # Replace :selenium with :rack_test for faster, headless tests
  browser = Capybara::Session.new(:rack_test, ShoutyApp)
  geo_location = @locations[location]
  url = "/?lat=#{geo_location[0]}&lon=#{geo_location[1]}"
  browser.visit(url)
  @browsers[person_name] = browser
end
