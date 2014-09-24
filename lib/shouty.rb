# This is where we'll write the code of our Shouty app

class Shouty
  def initialize
    @people = []
  end

  def person(name)
    person = Person.new(self)
    @people << person
    person
  end

  def broadcast(message, shouter)
    @people.each do |person|
      distance = person.distance_from(shouter)
      if distance <= 500
        person.receive(message)
      end
    end
  end

end

class Person
  attr_reader :received_messages, :coordinates

  def initialize(shouty)
    @shouty = shouty
    @received_messages = []
  end

  def position=(coordinates)
    @coordinates = coordinates
  end

  def shout(message)
    @shouty.broadcast(message, self)
  end

  def distance_from(other_person)
    x1 = @coordinates[0]
    y1 = @coordinates[1]
    x2 = other_person.coordinates[0]
    y2 = other_person.coordinates[1]

    Math.sqrt( (x2-x1)**2 + (y2-y1)**2 )
  end

  def receive(message)
    @received_messages << message
  end
end
