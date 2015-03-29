#!/usr/bin/env ruby
# usage: ./w1_trie_matching.rb sample.in > answer.out

require_relative '../lib/trie.rb'

sample_file_path = ARGV[0]
text, patterns = File.open(sample_file_path, "r") do |f|
  text = f.readline.chomp
  patterns = f.readlines.collect(&:chomp)
  [text, patterns]
end

trie = Trie.construct patterns
puts trie.match(text).keys.join " "
