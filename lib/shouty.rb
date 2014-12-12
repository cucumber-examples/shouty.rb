class Network
  def initialize
    @people = []
  end

  def log_in(person)
    @people << person
  end

  def broadcast(content)
    @people.each do |person|
      person.hear(content)
    end
  end
end

class Person
  attr_reader :last_heard_shout

  def initialize(network)
    @network = network
    @network.log_in(self)
  end

  def shout(content)
    @network.broadcast(content)
  end

  def hear(content)
    @last_heard_shout = content
  end
end
