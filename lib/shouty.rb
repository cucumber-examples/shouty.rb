class Person
  attr_accessor :location, :last_shouted_message
  attr_reader :name

  def initialize(shoutbox, name)
    @shoutbox = shoutbox
    @name = name
    @location = [0, 0]
  end

  def shout(message)
    @shoutbox.deliver(self, message)
    @last_shouted_message = message
  end

  def hear(message)
    @last_heard_message = message
  end

  def last_heard_message
    @last_heard_message
  end
end

class Shoutbox
  def initialize
    @people = {}
    @gps_calculator = GpsCalculator.new
  end

  def [](name)
    @people[name] ||= Person.new(self, name)
  end

  def deliver(shouter, message)
    @people.values.each do |person|
      distance = @gps_calculator.distance(person.location, shouter.location)
      if(distance <= 1000 && person != shouter)
        person.hear(message)
      end
    end
  end
end

class GpsCalculator
  def distance loc1, loc2
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad  = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end
end
