#!/usr/bin/ruby

class Day05
  class Part1
    def self.run(inputs)
      inputs.map { |input| input.tr('FLBR', '0011').to_i(2) }.max
    end
  end

  class Part2
    def self.run(inputs)
      seat_positions = inputs.map { |input| input.tr('FLBR', '0011').to_i(2) }.sort
      missing_seat_pointer = seat_positions.each_cons(2).reject { |collection| collection.inject(&:-) == -1 }.flatten
      missing_seat_pointer.first + 1 # Bit hacky but it works :D
    end
  end
end

inputs = File.readlines('inputs/day05.txt')
puts "Day05::Part1 answer: #{Day05::Part1.run(inputs)}"
puts "Day05::Part2 answer: #{Day05::Part2.run(inputs)}"
