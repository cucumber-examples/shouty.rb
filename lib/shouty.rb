# This is where we'll write the code of our Shouty app

class Person
  attr_accessor :location

  def initialize(shoutbox)
    @shoutbox = shoutbox
    shoutbox.add_person(self)
  end

  def shout(message)
    @shoutbox.deliver(self, message)
  end

  def hear(message)
    @last_heard_message = message
  end

  def in_the_zone_of?(other_person)
    (location - other_person.location).abs <= 1000
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
    @people << person
  end

  def deliver(shouter, message)
    @people.each do |person|
      if(person.in_the_zone_of?(shouter))
        person.hear(message)
      end
    end
  end
end
