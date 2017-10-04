require 'rantly/rspec_extensions'
require 'shouty'
require 'coordinate'

describe Shouty do
  it "only tranmits shouts within 1000m" do
    property_of {
      shouter_loc  = Coordinate.new(*Rantly(2) { range(0, 2000) })
      listener_loc = Coordinate.new(*Rantly(2) { range(0, 2000) })
      guard shouter_loc.distance_from(listener_loc) < 1000

      [shouter_loc, listener_loc]
    }.check { |shouter_loc, listener_loc|
      shouty = Shouty.new
      shouty.set_location('shouter', shouter_loc)
      shouty.set_location('listener', listener_loc)
      shouty.shout('shouter', listener_loc)
      expect(shouty.messages_heard_by('listener').length).to eq(1)
    }
  end
end
