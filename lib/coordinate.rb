class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_from(other)
    # TODO: actually caluculate distance. I think we need to use the Pythagorean theorem?
    0
  end
end
