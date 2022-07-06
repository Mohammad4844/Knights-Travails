class Position
  # positions / moves are given in the format []

  attr_accessor :x, :y, :parent

  def initialize((x, y), parent = nil)
    @x = x
    @y = y
    @parent = parent
  end

  ##
  # Checks if 2 postions are equal. This method only checks their x & y coordinates
  # and does not check for the parent attribute
  def equal?(other)
    @x == other.x && @y == other.y
  end

  @@knight_moves = [
    { x: 1, y: 2 }, { x: -1, y: 2 },
    { x: 2, y: 1 }, { x: 2, y: -1 },
    { x: 1, y: -2 }, { x: -1, y: -2 },
    { x: -2, y: 1 }, { x: -2, y: -1 },
  ]

  def self.knight_moves
    @@knight_moves
  end
end
