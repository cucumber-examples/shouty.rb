class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_from(other)
    dx = other.x - x
    dy = other.y - y
    Math.sqrt(dx*dx+dy*dy)
  end
end
