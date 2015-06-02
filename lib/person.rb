class Person
  attr_accessor :name
  attr_accessor :geo_location

  def initialize(message_service)
    @message_service = message_service
    @messages_heard = []
  end

  def shout(message)
    @message_service.broadcast(message, self)
  end

  def messages_heard
    @messages_heard
  end

  def hear(message)
    @messages_heard.push(message)
  end
end
