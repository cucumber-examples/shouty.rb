require 'haversine'

class MessageService
  MESSAGE_RANGE_METRES = 1000

  def initialize(shouty)
    @shouty = shouty
  end

  def broadcast(message, shouting_person)
    @shouty.people.each do |receiving_person|
      if within_range?(receiving_person.geo_location, shouting_person.geo_location)
        receiving_person.hear(message)
      end
    end
  end

  def within_range?(geo_location_a, geo_location_b)
    distance = Haversine.distance(geo_location_a, geo_location_b)
    distance.to_meters <= MESSAGE_RANGE_METRES
  end
end
