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
      person.hear(message) if distance <= 1000
    end
  end
end

class Person
  attr_reader :last_heard_message, :position

  def initialize(network, position)
    @network = network
    @position = position
    network.register(self)
  end

  def shout(message)
    @network.broadcast(message, self) unless message.length > 256
  end

  def hear(message)
    @last_heard_message = message
  end
end
