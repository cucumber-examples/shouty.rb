# This is where we'll write the code of our Shouty app

class Person
  attr_accessor :location
  attr_reader   :heard_messages

  def initialize(shout_server)
    @heard_messages =  []
    @shout_server = shout_server
    @shout_server.subscribe(self)
  end

  def shout(message)
    @shout_server.deliver(message)
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

  def deliver(message)
    # loop over all people and deliver message
    @people.each do |person|
      person.hear(message)
    end
  end
end
