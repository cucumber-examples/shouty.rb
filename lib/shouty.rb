# This is where we'll write the code of our Shouty app

class Shouty
  def initialize
    @people = {}
  end

  def person_is_in(person_name, geo_location)
    person = Person.new
    person.name = person_name
    person.geo_location = geo_location

    @people[person_name] = person
  end

  def person_sends_a_message(person_name, message)
    person = @people[person_name]
    person.shout(message)
  end

  def messages_heard_by(person_name)
    person = @people[person_name]
    person.messages_heard
  end
end

class Person
  attr_accessor :name
  attr_accessor :geo_location

  def shout(message)
  end

  def messages_heard
    []
  end
end
