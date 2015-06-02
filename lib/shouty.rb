require 'haversine'

class Shouty
  def initialize
    @people = {}
    @message_service = MessageService.new(self)
  end

  def people
    @people.values
  end

  def person_is_in(person_name, geo_location)
    person = Person.new(@message_service)
    person.name = person_name
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
end

class MessageService
  def initialize(shouty)
    @shouty = shouty
  end

  def broadcast(message, shouting_person)
    @shouty.people.each do |receiving_person|
      if within_range?(receiving_person.geo_location, shouting_person.geo_location)
        receiving_person.hear(message)
      end
    end
  end

  def within_range?(geo_location_a, geo_location_b)
    distance = Haversine.distance(geo_location_a, geo_location_b)
    distance.to_meters <= 1000
  end
end

class Person
  attr_accessor :name
  attr_accessor :geo_location

  def initialize(message_service)
    @message_service = message_service
    @messages_heard = []
  end

  def shout(message)
    @message_service.broadcast(message, self)
  end

  def messages_heard
    @messages_heard
  end

  def hear(message)
    @messages_heard.push(message)
  end
end
