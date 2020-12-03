#!/usr/bin/ruby

class Day03
  class Part1
    def self.run(map)
      Day03.count_trees(map, [3, 1])
    end
  end

  class Part2
    def self.run(map)
      slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
      slopes.map { |slope| Day03.count_trees(map, slope) }.inject(:*)
    end
  end

  def self.count_trees(map, slope)
    trees = 0
    coordinates = { x: 0, y: 0 }

    while coordinates[:y] < (map.length - 1)
      coordinates[:x] += slope[0] # Move right
      coordinates[:y] += slope[1] # Move down
      coordinates[:x] -= map.first.length if coordinates[:x] > (map.first.length - 1) # Repeating pattern to the right

      location = map[coordinates[:y]][coordinates[:x]]

      trees += 1 if location == '#'
    end

    trees
  end
end

map = File.read('inputs/day03.txt').split("\n").each_with_object([]) do |row, map|
  map << row.chars
end

puts "Day03::Part1 answer: #{Day03::Part1.run(map)}"
puts "Day03::Part2 answer: #{Day03::Part2.run(map)}"
