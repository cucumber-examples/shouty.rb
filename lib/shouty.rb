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

  def broadcast(message)
    @people.each do |person|
      person.receive(message)
    end
  end
end

class Person

  def initialize(shouty)
    @shouty = shouty
    @received_messages = []
  end

  def position=(coordinates)
  end

  def shout(message)
    @shouty.broadcast(message)
  end

  def receive(message)
    @received_messages << message
  end


  def received_messages
    @received_messages
  end
end
