# This is where we'll write the code of our Shouty app

class Shouty
  def person_is_in(person_name, location_name)
    person = Person.new
    person.name = person_name
    person.geo_location = LOCATIONS[location_name]
  end
end

class Person
  attr_accessor :name
  attr_accessor :geo_location
end
