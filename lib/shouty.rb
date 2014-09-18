class Shouty
  def person(name)
    # TODO: Only create if not already created
    Person.new(name)
  end
end

class Person
  attr_accessor :location

  def initialize(name)
  end

  def shout(message)
  end

  def visible_messages
    ["50% off cheese at Sean's cheese hut"]
  end
end
