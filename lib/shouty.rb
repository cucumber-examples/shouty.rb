require 'message_service'
require 'person'

class Shouty
  def initialize
    @people = {}
    @message_service = MessageService.new(self)
  end

  def people
    @people.values
  end

  def person_is_in(person_name, geo_location)
    person = Person.new(@message_service)
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
