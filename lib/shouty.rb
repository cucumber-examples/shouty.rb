class Shouty
  def person(name)
    Person.new(name)
  end
end

class Person
  attr_accessor :location

  def initialize(name)
  end
end
