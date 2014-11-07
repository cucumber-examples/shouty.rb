class Person
  attr_accessor :location
  def initialize(shoutbox)
    @shoutbox = shoutbox
    shoutbox.add_person(self)
    @location = 0
  end
  def shout(message)
    @shoutbox.deliver(self, message)
  end
  def hear(message)
    @last_heard_message = message
  end
  def last_heard_message
    @last_heard_message
  end
end

class Shoutbox
  def initialize
    @people = []
  end
  def add_person(person)
    @people.push(person)
  end
  def deliver(shouter, message)
    @people.each do |person|
      distance = person.location - shouter.location
      if(distance <= 1000 && person != shouter)
        person.hear(message)
      end
    end
  end
end
