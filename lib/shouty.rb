# This is where we'll write the code of our Shouty app

class Person
  attr_accessor :geo_location
  attr_reader   :heard_messages

  def initialize(shout_server)
    @heard_messages =  []
    @shout_server = shout_server
    @shout_server.subscribe(self)
  end

  def shout(message)
    @shout_server.deliver(message, geo_location)
  end

  def hear(message)
    @heard_messages.push(message)
  end
end

class ShoutServer
  def initialize
    @people = []
  end

  def subscribe(person)
    @people.push(person)
  end

  def deliver(message, shout_geo_location)
    # loop over all people and deliver message
    @people.each do |person|
      if within_range?(person.geo_location, shout_geo_location)
        person.hear(message)
      end
    end
  end

  def within_range?(geo_location_a, geo_location_b)
    puts geo_location_a
  end
end
