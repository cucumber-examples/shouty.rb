require 'person'
require 'haversine'

class Shouty
  MESSAGE_RANGE_METRES = 1000

  def initialize
    @people = {}
  end

  def person_is_in(person_name, geo_location)
    person = Person.new(self)
    person.geo_location = geo_location

    @people[person_name] = person
  end

  def person_shouts(person_name, message)
    person = @people[person_name]
    person.shout(message)
  end

  def messages_heard_by(person_name)
    person = @people[person_name]
    person.messages_heard
  end

  def geo_location_of(person_name)
    @people[person_name].geo_location
  end

  def broadcast(shouter, message)
    @people.values.each do |listener|
      if within_range?(listener.geo_location, shouter.geo_location)
        listener.hear(message)
      end
    end
  end

private

  def within_range?(geo_location_a, geo_location_b)
    distance = Haversine.distance(geo_location_a, geo_location_b)
    distance.to_meters <= MESSAGE_RANGE_METRES
  end
end
