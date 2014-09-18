class Shouty
  def initialize
    @messages = []
    @people = {}
  end

  def person(name)
    @people[name] ||= Person.new(self, name)
  end

  def store_message(message)
    @messages << message
  end

  def messages_close_to(location)
    @messages.select do |message|
      message.close_to?(location)
    end
  end
end

class Person
  attr_accessor :location

  def initialize(shouty, name)
    @shouty = shouty
  end

  def shout(message_text)
    message = Message.new(message_text, location)
    @shouty.store_message(message)
  end

  def visible_messages
    @shouty.messages_close_to(location)
  end
end

class Message
  attr_reader :message_text

  def initialize(message_text, location)
    @message_text, @location = message_text, location
  end

  def close_to?(other_location)
    dx = other_location[0] - @location[0]
    dy = other_location[1] - @location[1]
    distance = Math.sqrt(dx*dx + dy*dy)
    distance < 500
  end
end
