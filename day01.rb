#!/usr/bin/ruby

class Day01
  def self.run
    Part1.run
    Part2.run
  end

  class Part1
    def self.run
      inputs = File.read('inputs/day01.txt').split("\n").map(&:to_i)
      result = inputs.flat_map do |i|
        inputs.find { |j| i + j == 2020 }
      end.compact.inject(&:*)

      puts "Day01::Part1 answer: #{result}"
    end
  end

  class Part2
    def self.run
      inputs = File.read('inputs/day01.txt').split("\n").map(&:to_i)

      result = inputs.flat_map do |i|
        inputs.flat_map do |j|
          inputs.find do |k|
            i + j + k == 2020
          end
        end
      end.compact.uniq.inject(&:*)


      puts "Day01::Part2 answer: #{result}"
    end
  end
end

Day01.run
