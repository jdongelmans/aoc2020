#!/usr/bin/ruby

class Day01
  def self.run
    Part1.run
    Part2.run
  end

  class Part1
    def self.run
      inputs = File.read('inputs/day01.txt').split("\n").map(&:to_i)
      result = inputs.combination(2).select { |combination| combination.sum == 2020 }.flatten.inject(&:*)

      puts "Day01::Part1 answer: #{result}"
    end
  end

  class Part2
    def self.run
      inputs = File.read('inputs/day01.txt').split("\n").map(&:to_i)
      result = inputs.combination(3).select { |combination| combination.sum == 2020 }.flatten.inject(&:*)

      puts "Day01::Part2 answer: #{result}"
    end
  end
end

Day01.run
