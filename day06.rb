#!/usr/bin/ruby

class Day06
  class Part1
    def self.run(groups)
      groups.map { |group| group.join.chars.uniq.count }.sum
    end
  end

  class Part2
    def self.run(groups)
      groups.map do |group|
        char_counts = group.join.chars.group_by(&:itself).transform_values(&:count) # Ruby2.7 Enumerable#tally
        char_counts.values.select { |char_count| char_count == group.count }.count
      end.sum
    end
  end
end

groups = File.read('inputs/day06.txt').split("\n\n").map { |input| input.split("\n") }
puts "Day06::Part1 answer: #{Day06::Part1.run(groups)}"
puts "Day06::Part2 answer: #{Day06::Part2.run(groups)}"
