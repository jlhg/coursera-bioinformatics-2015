#!/usr/bin/env ruby
# usage: ./w1_trie_construction.rb sample.in > answer.out

require_relative '../lib/trie'

sample_file_path = ARGV[0]
patterns = File.open(sample_file_path, "r") do |f|
  f.readlines.collect(&:chomp)
end

trie = Trie.construct patterns
trie.traverse do |node|
  puts "#{node.parent_node.index}->#{node.index}:#{node.value}" unless node.root?
end
