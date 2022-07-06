##
# A class representing a position in the chess game board. This class also plays the role
# of a 'node' in a tree. Its attributes are:
#
# @x, @y -> respective x & y coordinates of the position
# @parent -> a parent, which is also a Position object, used to denote the previous locatio
# when traversing through the BST / chess board

class Position
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

  ##
  # an array of hashes representing all the possible movesa knight can make. Attributes can 
  # be accessed by keys ':x' and ':y"
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
