#!/usr/bin/ruby

class Day08
  def self.instruct(instruction, accumulator, index)
    case instruction[0]
    when 'acc'
      accumulator += instruction[1].to_i
      index += 1
    when 'jmp'
      index += instruction[1].to_i
    when 'nop'
      index += 1
    else
      raise 'error'
    end

    [accumulator, index]
  end

  class Part1
    def self.run(instructions)
      accumulator = 0
      index = 0

      visited_indexes = []

      until visited_indexes.include?(index)
        visited_indexes << index
        accumulator, index = Day08.instruct(instructions[index], accumulator, index)
      end

      accumulator
    end
  end

  class Part2
    def self.run(instructions)
      instructions.each_with_index do |(instruction, _), instruction_index|
        next if instruction == 'acc'

        # Use Marshal here to make a deep_dup of the object
        dupped_instructions = Marshal.load(Marshal.dump(instructions))

        case instruction
        when 'jmp'
          dupped_instructions[instruction_index][0] = 'nop'
        when 'nop'
          dupped_instructions[instruction_index][0] = 'jmp'
        end

        accumulator = 0
        index = 0
        visited_indexes = []

        until visited_indexes.include?(index)
          visited_indexes << index
          accumulator, index = Day08.instruct(dupped_instructions[index], accumulator, index)

          return accumulator if instructions.count == index
        end
      end
    end
  end
end

instructions = File.readlines('inputs/day08.txt').map { |instruction| instruction.split(' ') }
puts "Day08::Part1 answer: #{Day08::Part1.run(instructions)}"
puts "Day08::Part2 answer: #{Day08::Part2.run(instructions)}"
