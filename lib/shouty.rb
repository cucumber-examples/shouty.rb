class Network
  def initialize(range)
    @people = []
    @range = range
  end

  def log_in(person)
    @people << person
  end

  def broadcast(content, from)
    @people.each do |person|
      distance = (from - person.location).abs
      person.hear(content) if distance < @range
    end
  end
end

class Person
  attr_reader :last_heard_shout, :location

  def initialize(network, location)
    @network = network
    @network.log_in(self)
    @location = location
  end

  def shout(content)
    @network.broadcast(content, @location)
  end

  def hear(content)
    @last_heard_shout = content
  end
end
