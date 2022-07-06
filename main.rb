require_relative 'knights_travails'

puts 
puts 'Get the shortest path for a knight between 2 positions'
puts
puts "Enter coordinates in the format: '3 5' for (3,5)"
puts 'Enter the starting coordinates x and y (0-7): '
start = gets.chomp.split(' ').map(&:to_i)
puts 'Enter the ending coordinates x and y (0-7): '
finish = gets.chomp.split(' ').map(&:to_i)

KnightsTravails.new.knight_moves(start, finish)