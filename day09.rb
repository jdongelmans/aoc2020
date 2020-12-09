#!/usr/bin/ruby

class Day09
  class Part1
    def self.run(inputs)
      preamble_count = 25

      inputs = inputs.dup
      inputs.each_with_object(inputs.shift(preamble_count)) do |input, preamble|
        return input if preamble.combination(2).none? { |combination| combination.sum == input }

        preamble.shift && preamble.push(input)
      end
    end
  end

  class Part2
    def self.run(inputs)
      invalid_number = Part1.run(inputs)

      2.upto(inputs.count).each do |i|
        inputs.each_cons(i).each do |combination|
          return combination.minmax.sum if combination.sum == invalid_number
        end
      end
    end
  end
end

inputs = File.readlines('inputs/day09.txt').map(&:to_i)
puts "Day09::Part1 answer: #{Day09::Part1.run(inputs)}"
puts "Day09::Part2 answer: #{Day09::Part2.run(inputs)}"
