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
    @child_nodes << node
  end

  def find_child_node(value)
    @child_nodes.each do |node|
      return node if node.value == value
    end
    nil
  end
end
