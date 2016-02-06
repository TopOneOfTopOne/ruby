
class Node
  attr_accessor :value, parent, left, right
  def initialize(value)
    @value = value
  end
end

def build_tree(arr)
  master_node = Node.new(arr.first)
  nodes = [master_node]
  arr[1..-1].each do |value|
    new_node = Node.new(value)
    current_node = master_node #reset the node to be evaluated as master node
    loop do 
      new_node.parent = current_node
      if current_node.value > new_node.value 
        if is_left_leaf?(new_node)
          current_node.left = new_node
          nodes << new_node
          break
        else
          current_node = current_node.left
        end
      else
        if is_right_leaf?(new_node)
          current_node.right = new_node
          nodes << new_node
          break
        else
          current_node = current_node.right
        end
     end
    end
    nodes
  end
end

def print_binary_tree(nodes)
  nodes.first.to_s.center(1+nodes.)
end

def is_left_leaf?(node)
  if node.parent.left
    return false
  else
    return true 
  end
end

def is_right_leaf?(node)
  if node.parent.right
    return false
  else
    return true
  end
end