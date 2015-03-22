#!/usr/bin/env ruby
# usage: ./w1_trie_construction.rb <sample.in>

require_relative '../lib/data_structure'
include DataStructure

sample_file_path = ARGV[0]
patterns = File.open(sample_file_path, "r") do |f|
  f.readlines.collect(&:chomp)
end

trie = Trie.construct patterns
trie.traverse do |node|
  puts "#{node.parent_node.index}->#{node.index}:#{node.value}" unless node.root?
end
