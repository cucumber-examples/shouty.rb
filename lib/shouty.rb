# This is where we'll write the code of our Shouty app

class Person
  attr_accessor :location

  def initialize(shoutbox)
    @shoutbox = shoutbox
    shoutbox.add_person(self)
  end

  def shout(message)
    @shoutbox.deliver(message)
  end

  def last_heard_message
  end
end

class Shoutbox
  def initialize
    @people = []
  end

  def deliver(message)
    @people.each do |person|
      if(person.in_the_zone_of?(shouter))
        person.hear(message)
      end
    end
  end
end
