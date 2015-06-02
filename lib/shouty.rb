# This is where we'll write the code of our Shouty app

class Shouty
  def person_is_in(person_name, geo_location)
    person = Person.new
    person.name = person_name
    person.geo_location = geo_location
  end
end

class Person
  attr_accessor :name
  attr_accessor :geo_location
end
