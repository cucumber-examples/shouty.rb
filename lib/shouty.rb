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

  def person_sends_a_message(person_name, message)
    person = @people[person_name]
    person.shout(message)
  end

  def messages_heard_by(person_name)
    person = @people[person_name]
    person.messages_heard
  end

  def broadcast(message, shouting_person)
    @people.values.each do |receiving_person|
      if within_range?(receiving_person.geo_location, shouting_person.geo_location)
        receiving_person.hear(message) unless shouting_person == receiving_person
      end
    end
  end

private

  def within_range?(geo_location_a, geo_location_b)
    distance = Haversine.distance(geo_location_a, geo_location_b)
    distance.to_meters <= MESSAGE_RANGE_METRES
  end
end
