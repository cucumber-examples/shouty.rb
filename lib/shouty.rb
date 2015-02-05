# This is where we'll write the code of our Shouty app

class Person
  attr_accessor :location
  attr_reader   :heard_messages

  def initialize
    @heard_messages =  []
  end

  def shout(message)
  end
end
