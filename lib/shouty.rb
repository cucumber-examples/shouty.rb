# lib/shouty.rb

class Network
  def initialize
    @people = []
  end

  def register(person)
    @people << person
  end

  def broadcast(message, shouter)
    @people.each do |person|
      distance = (shouter.position - person.position).abs
      if distance <= 1000
        person.hear(message)
      end
    end
  end
end

class Person
  attr_reader :last_heard_message

  def initialize(network, position)
    @network = network
    @position = position
    network.register(self)
  end

  def shout(message)
    @network.broadcast(message, self)
  end

  def hear(message)
    @last_heard_message = message
  end

  def position
    @position
  end
end
