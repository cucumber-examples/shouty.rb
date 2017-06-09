require_relative './coordinate'

class Shouty
    MESSAGE_RANGE = 1000

    def initialize
      @locations = {}
      @messages = {}
    end

    def set_location(person, location)
      @locations[person] = location
    end

    def shout(person, message)
      @messages[person] = message
    end

    def messages_heard_by(listener)
      result = {}

      @messages.each do |shouter, message|
        distance = @locations[listener].distance_from(@locations[shouter])
        if (distance < MESSAGE_RANGE)
          result[shouter] = message
        end
      end

      result
    end
end
