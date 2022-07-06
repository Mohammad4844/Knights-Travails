class KnightsTravails
  require_relative 'position'

  def initialize; end
  
  ##
  # Method used to calculate the path a knight takes from given starting coordinates to given finishing coordinates
  def knight_moves(start_coordinates, finish_coordinates)
    return 'Illegal Arguments Error' unless correct_arguments?(start_coordinates, finish_coordinates)
    shortest_path(Position.new(start_coordinates), Position.new(finish_coordinates))
  end

  private

  ##
  # Calculates the shortest path from the starting Position to the finish Position, and prints it out
  def shortest_path(start, finish)
    end_position = breadth_first_search(start, finish)
    path = construct_path(end_position)
    print_path(path)
  end

  ##
  # A breadth-first-search algorithm which treats possible moves a knight can make as children in a Binary 
  # Search Tree, and searches for the shortest path to the finishing position. It returns a Position object
  # representing the final coordinates, which has record of all previous positions in its Position#parent 
  # attribute.
  def breadth_first_search(position, finish, queue = [])
    return position if position.equal?(finish)

    Position.knight_moves.each do |move|
      if legal_move?(position, move)
        queue << Position.new([position.x + move[:x], position.y + move[:y]], position)
      end
    end

    breadth_first_search(queue.shift, finish, queue)
  end

  ##
  # Constructs a path from a given Position object backwards, given that other positions are connected to it
  # by its parents. Returns the coordinates of each position in an array of arrays, with the ending position
  # in the end
  def construct_path(end_position)
    return [[end_position.x, end_position.y]] if end_position.parent.nil?
    construct_path(end_position.parent) + [[end_position.x, end_position.y]]
  end

  def print_path(path)
    no_of_moves = path.length - 1
    puts "You made it in #{no_of_moves} move(s)!"
    path.each { |pos| p pos }
  end

  def correct_arguments?(start_coordinates, finish_coordinates)
    case [start_coordinates, finish_coordinates]
    in [[0..7, 0..7], [0..7, 0..7]]
      return true
    else
      puts 'Incorrect coordinates entered'
      return false
    end
  end

  def legal_move?(position, move)
    (position.x + move[:x]).between?(0, 7) && (position.y + move[:y]).between?(0, 7)
  end
end
