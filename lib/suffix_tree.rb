require 'node'

class String
  def suffix_strings
    length.times do |index|
      self[index..-1]
    end
  end
end

class EdgeLabel
  attr_reader :position, :length

  def initialize(position, length)
    @position = position
    @length = length
  end
end

class SuffixTree
  attr_reader :edge_labels

  def initialize
    @root = Node.new(root_index, 0, is_root: true)
    @edge_labels = []
  end

  def self.construct(text)
    index = 0
    suffix_tree = new
    text.suffix_strings.each do |pattern|
      edge_label = new EdgeLabel index, pattern.length
      edge_position =
    end
  end

    # index = 0
    # trie = new index
    patterns.each do |pattern|
      current_node = trie.root
      pattern.each_char do |char|
        child_node = current_node.find_child_node char
        if child_node.nil?
          index += 1
          new_node = Node.new index, char, parent_node: current_node
          current_node.add_child(new_node)
          current_node = new_node
        else
          current_node = child_node
        end
      end
    end
    trie
  end

  def initialize(root_index = 0)
    @root = Node.new(root_index, "$", is_root: true)
  end

  def traverse(type = "dfs", &block)
    case type
    when "dfs"
      dfs(&block)
    end
  end

  def match(text)
    match_info = {}
    chars = text.split ""
    chars.each_index do |i|
      pattern =  prefix_match(chars[i..-1])
      match_info[i] = pattern unless pattern.nil?
    end
    match_info
  end

  private

  def dfs
    stack = []
    current_node = @root
    stack.push << current_node
    until stack.empty?
      unless current_node.child_nodes.empty?
        stack.concat current_node.child_nodes
      end
      current_node = stack.pop
      yield current_node
    end
  end

  def prefix_match(chars)
    symbol = chars.first
    spell = []
    v = @root
    index = 1
    loop do
      if v.child_nodes.empty?
        return spell.join
      else
        has_edge = false
        v.child_nodes.each do |w|
          if w.value == symbol
            symbol = chars[index]
            index += 1
            v = w
            has_edge = true
            break
          end
        end
        return unless has_edge
      end
    end
  end
end
