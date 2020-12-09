#!/usr/bin/ruby

class Day07
  def self.build_tree(rules)
    rules.each_with_object({}) do |rule, tree|
      colour, contents = rule.split('bags contain')
      contents = contents.split(',').map(&:strip).each_with_object({}) do |item, hash|
        match = item.match(/(\d+)(.+)bag/)
        next unless match

        hash[match[2].strip] = match[1].to_i
      end

      tree[colour.strip] = contents
    end
  end

  class Part1
    def self.run(rules)
      tree = Day07.build_tree(rules)
      reverse_tree = build_reverse_tree(tree)

      directs = reverse_tree['shiny gold']
      indirects = []
      previous_size = -1

      while indirects.size != previous_size
        previous_size = indirects.size

        indirects += (directs + indirects).flat_map { |item| reverse_tree[item] }.compact
        indirects.uniq!
      end

      (directs + indirects).uniq.count
    end

    def self.build_reverse_tree(tree)
      tree.each_with_object({}) do |(colour, contents), reverse_tree|
        contents.each_key do |content|
          reverse_tree[content] ||= []
          reverse_tree[content] << colour
        end
      end
    end
  end

  class Part2
    def self.run(rules)
      tree = Day07.build_tree(rules)

      count_children(tree, 'shiny gold')
    end

    def self.count_children(tree, colour)
      total = 0
      subtree = tree[colour]
      subtree.each do |colour, count|
        total += count + (count * count_children(tree, colour))
      end

      total
    end
  end
end

rules = File.readlines('inputs/day07.txt')
puts "Day07::Part1 answer: #{Day07::Part1.run(rules)}"
puts "Day07::Part2 answer: #{Day07::Part2.run(rules)}"
