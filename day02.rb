#!/usr/bin/ruby

class Day02
  def self.run
    Part1.run
    Part2.run
  end

  class Part1
    def self.run
      inputs = File.read('inputs/day02.txt').split("\n")
      result = inputs.count { |input| validate_password(input) }

      puts "Day02::Part1 answer: #{result}"
    end

    def self.validate_password(input)
      validation, password = input.split(':').map(&:strip)

      values, char = validation.split(' ')
      min, max = values.split('-').map(&:to_i)

      (min..max).include?(password.count(char))
    end
  end

  class Part2
    def self.run
      inputs = File.read('inputs/day02.txt').split("\n")
      result = inputs.count { |input| validate_password(input) }

      puts "Day02::Part2 answer: #{result}"
    end

    def self.validate_password(input)
      validation, password = input.split(':').map(&:strip)

      values, char = validation.split(' ')
      positions = values.split('-').map(&:to_i)

      positions.one? { |position| password[position - 1] == char }
    end
  end
end

Day02.run
