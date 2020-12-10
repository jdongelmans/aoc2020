#!/usr/bin/ruby

class Day10
  class Part1
    def self.run(inputs)
      inputs.push(0, (inputs.max + 3)).sort!
      mapping = inputs.each_cons(2).map { |combination| combination.reverse.inject(&:-) }.group_by(&:itself).transform_values(&:size)
      mapping[1] * mapping[3]
    end
  end

  class Part2
    def self.run(inputs)
      inputs.push(0, (inputs.max + 3)).sort!
      mapping = inputs.each_cons(2).map { |combination| combination.reverse.inject(&:-) }
      sequence_of_ones = mapping.chunk { |i| i == 1 }.map { |one, array| array.count if one }.compact

      sequence_of_ones.group_by(&:itself).transform_values(&:size).map do |sequence, count|
        base = (sequence**2 - sequence + 2) / 2
        base**count
      end.inject(&:*)
    end
  end
end

inputs = File.readlines('inputs/day10.txt').map(&:to_i)
puts "Day10::Part1 answer: #{Day10::Part1.run(inputs)}"
puts "Day10::Part2 answer: #{Day10::Part2.run(inputs)}"
