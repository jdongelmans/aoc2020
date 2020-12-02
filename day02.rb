#!/usr/bin/ruby

class Day02
  class Part1
    def self.run(inputs)
      inputs.count { |input| validate_password(input) }
    end

    def self.validate_password(input)
      validation, password = input.split(':').map(&:strip)
      values, char = validation.split(' ')
      min, max = values.split('-').map(&:to_i)

      (min..max).include?(password.count(char))
    end
  end

  class Part2
    def self.run(inputs)
      inputs.count { |input| validate_password(input) }
    end

    def self.validate_password(input)
      validation, password = input.split(':').map(&:strip)
      values, char = validation.split(' ')
      positions = values.split('-').map(&:to_i)

      positions.one? { |position| password[position - 1] == char }
    end
  end
end

inputs = File.read('inputs/day02.txt').split("\n")
puts "Day02::Part1 answer: #{Day02::Part1.run(inputs)}"
puts "Day02::Part2 answer: #{Day02::Part2.run(inputs)}"
