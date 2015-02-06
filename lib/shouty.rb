# This is where we'll write the code of our Shouty app

class Person
  attr_accessor :geo_location
  attr_reader   :heard_messages
  attr_reader   :heard_shouts
  attr_reader   :name

  def initialize(name, shout_server)
    @heard_messages =  []
    @heard_shouts = []
    @shout_server = shout_server
    @shout_server.subscribe(self)
    @name = name
  end

  def shout(message)
    @shout_server.deliver(message, Shout.new(self.name, message), geo_location)
  end

  def hear(message, shout)
    @heard_messages.push(message)
    @heard_shouts.push(shout)
  end
end

class Shout
  attr_reader :shouter_name, :message
  def initialize(shouter_name, message)
    @shouter_name = shouter_name
    @message = message
  end
end

class ShoutServer
  def initialize
    @people = []
  end

  def subscribe(person)
    @people.push(person)
  end

  def deliver(message, shout, shout_geo_location)
    return if too_long?(message)
    # loop over all people and deliver message
    @people.each do |person|
      if within_range?(person.geo_location, shout_geo_location)
        person.hear(message, shout)
      end
    end
  end

private

  def too_long?(message)
    message.length > 140
  end

  def within_range?(loc1, loc2)
    distance(loc1, loc2) <= 1000
  end

  def distance(loc1, loc2)
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
