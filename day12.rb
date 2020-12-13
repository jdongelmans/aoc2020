#!/usr/bin/ruby

class Day12
  class Part1
    def self.run(inputs)
      position = [0, 0]
      heading = 90

      inputs.each do |instruction|
        movement, heading = parse_instruction(instruction, heading)
        position[0] += movement[0]
        position[1] += movement[1]
        puts "#{instruction.strip}: movement #{movement} with heading #{heading} -- #{position}"
      end

      position.map(&:abs).sum
    end

    def self.parse_instruction(instruction, heading)
      action = instruction[0]
      amount = instruction[1..].to_i

      if action == 'F'
        case heading
        when 0
          action = 'N'
        when 90
          action = 'E'
        when 180
          action = 'S'
        when 270
          action = 'W'
        end
      end

      case action
      when 'N'
        [[0, amount], heading]
      when 'S'
        [[0, -amount], heading]
      when 'E'
        [[amount, 0], heading]
      when 'W'
        [[-amount, 0], heading]
      when 'L'
        [[0, 0], (360 + heading - amount).abs % 360]
      when 'R'
        [[0, 0], (heading + amount).abs % 360]
      end
    end
  end

  class Part2
    def self.run(inputs) end
  end
end

inputs = File.readlines('inputs/day12.txt')
# inputs = <<-INPUT
# F10
# N3
# F7
# R90
# F11
# INPUT
#   .split("\n")
puts "Day12::Part1 answer: #{Day12::Part1.run(inputs)}"
puts "Day12::Part2 answer: #{Day12::Part2.run(inputs)}"
