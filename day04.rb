#!/usr/bin/ruby

class Day04
  REQUIRED_KEYS = %w[byr iyr eyr hgt hcl ecl pid].freeze
  OPTIONAL_KEYS = %w[cid].freeze

  class Part1
    def self.run(passport_inputs)
      passport_inputs.select do |passport_data|
        (REQUIRED_KEYS - passport_data.keys).empty?
      end.count
    end
  end

  class Part2
    def self.run(passport_inputs)
      passport_inputs.select do |passport_data|
        validate_passport_data(passport_data)
      end.count
    end

    def self.validate_passport_data(passport_data)
      REQUIRED_KEYS.all? do |key|
        data = passport_data[key]
        return false unless data

        case key
        when 'byr'
          (1920..2002).include?(data.to_i)
        when 'iyr'
          (2010..2020).include?(data.to_i)
        when 'eyr'
          (2020..2030).include?(data.to_i)
        when 'hgt'
          height_data = data.match(/\A(\d+)(cm|in)\z/)
          return false unless height_data

          case height_data[2]
          when 'cm'
            (150..193).include?(height_data[1].to_i)
          when 'in'
            (59..76).include?(height_data[1].to_i)
          else
            false
          end
        when 'hcl'
          data.match(/\A#[0-9a-f]{6}\z/)
        when 'ecl'
          %w[amb blu brn gry grn hzl oth].include?(data)
        when 'pid'
          data.match(/\A\d{9}\z/)
        when 'cid'
          # ignored
        else
          # ignored
        end
      end
    end
  end
end

passport_inputs = File.read('inputs/day04.txt').split("\n\n").map do |input|
  passport_entry = input.split(/\s/).map(&:strip)
  passport_entry.map { |x| x.split(':') }.each_with_object({}) do |(k, v), data|
    data[k] = v
  end
end

puts "Day04::Part1 answer: #{Day04::Part1.run(passport_inputs)}"
puts "Day04::Part2 answer: #{Day04::Part2.run(passport_inputs)}"
