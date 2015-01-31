require 'shouty'

class Place
  attr_reader :name, :location
  def initialize(name, location)
    @name = name
    @location = location
  end
end

Before do
  @shoutbox = Shoutbox.new
  @people = []
  @places = [
      Place.new('the Winchester on Essex Road', [51.536331,-0.101742]),
      Place.new('the Three Crowns in Stoke Newington', [51.562032,-0.0738]),
      Place.new('the Steam Passage Tavern on Upper Street', [51.534885,-0.104494]),
  ]
  @gps_calculator = GpsCalculator.new
end

Given(/^(.*) is at (.*)$/) do |person_name, place_name|
  place = @places.find {|p| p.name == place_name}
  person = @shoutbox[person_name]
  person.location = place.location
  @people << person
end

When(/^(.*) shouts "(.*)"$/) do |person_name, content|
  @people.find{ |p| p.name == person_name}.shout(content)
end


Then(/^(.*) should not hear (.*)'s shout$/) do |hearer_name, shouter_name|
  hearer = @shoutbox[hearer_name]
  shouter = @shoutbox[shouter_name]

  if hearer.last_heard_message == shouter.last_shouted_message
    distance = @gps_calculator.distance(hearer.location, shouter.location)
    raise "#{hearer_name} unexpectedly heard #{shouter_name}'s message despite being #{distance} away"
  end
end

Then(/^(.*) should hear (.*)'s shout$/) do |hearer_name, shouter_name|
  hearer = @shoutbox[hearer_name]
  shouter = @shoutbox[shouter_name]

  if hearer.last_heard_message != shouter.last_shouted_message
    distance = @gps_calculator.distance(hearer.location, shouter.location)
    raise "#{hearer_name} did not hear #{shouter_name}'s message despite being #{distance} away"
  end
end

Then(/^(.*) should not hear himself$/) do |hearer_name|
  hearer = @shoutbox[hearer_name]
  if hearer.last_heard_message == hearer.last_shouted_message
    raise "#{hearer_name} heard himself - that's bad"
  end
end
