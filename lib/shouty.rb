# lib/shouty.rb

class Network
  def initialize
    @people = []
  end

  def register(person)
    @people << person
  end

  def broadcast(message)
    @people.each do |person|
      person.hear(message)
    end
  end
end

class Person
  attr_reader :last_heard_message

  def initialize(network)
    @network = network
    network.register(self)
  end

  def shout(message)
    @network.broadcast(message)
  end

  def hear(message)
    @last_heard_message = message
  end
end
