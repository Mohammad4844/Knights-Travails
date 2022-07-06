class KnightsTravails
  require_relative 'position'

  def initialize; end

  def knight_moves(start_coordinates, finish_coordinates)
    return 'Illegal Arguments Error' unless correct_arguments?(start_coordinates, finish_coordinates)
    find_shortest_path(Position.new(start_coordinates), Position.new(finish_coordinates))
  end

  private

  def find_shortest_path(start, finish)
    end_position = breadth_first_search(start, finish)
    path = construct_path(end_position)
    print_path(path)
  end

  ##
  # Builds path as it goes
  def breadth_first_search(position, finish, queue = [])
    return position if position.equal?(finish)

    Position.knight_moves.each do |move|
      if legal_move?(position, move)
        queue << Position.new([position.x + move[:x], position.y + move[:y]], position)
      end
    end

    breadth_first_search(queue.shift, finish, queue)
  end

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
