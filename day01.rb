#!/usr/bin/ruby

class Day01
  class Part1
    def self.run(inputs)
      inputs.combination(2).select { |combination| combination.sum == 2020 }.flatten.inject(&:*)
    end
  end

  class Part2
    def self.run(inputs)
      inputs.combination(3).select { |combination| combination.sum == 2020 }.flatten.inject(&:*)
    end
  end
end

inputs = File.read('inputs/day01.txt').split("\n").map(&:to_i)
puts "Day01::Part1 answer: #{Day01::Part1.run(inputs)}"
puts "Day01::Part2 answer: #{Day01::Part2.run(inputs)}"
