class Person
  attr_accessor :geo_location, :messages_heard

  def initialize(shouty)
    @shouty = shouty
    @messages_heard = []
  end

  def shout(message)
    @shouty.broadcast(message, self)
  end

  def hear(message)
    @messages_heard.push(message)
  end
end
