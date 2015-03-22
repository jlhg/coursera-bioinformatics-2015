module DataStructure
  class Node
    attr_reader :index, :value, :child_nodes, :parent_node, :is_root
    alias_method :root?, :is_root

    def initialize(index, value, is_root: false, parent_node: nil)
      @index = index
      @value = value
      @parent_node = parent_node
      @child_nodes = []
      @is_root = is_root
    end

    def add_child(node)
      @child_nodes.push(node)
    end

    def find_child_node(value)
      @child_nodes.each do |node|
        return node if node.value == value
      end
      nil
    end
  end

  class Trie
    attr_reader :root

    def self.construct(patterns)
      index = 0
      trie = new index
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

    private

    def dfs
      stack = []
      current_node = @root
      stack.push(current_node)
      until stack.empty?
        unless current_node.child_nodes.empty?
          stack.concat current_node.child_nodes
        end
        current_node = stack.pop
        yield current_node
      end
    end
  end
end
