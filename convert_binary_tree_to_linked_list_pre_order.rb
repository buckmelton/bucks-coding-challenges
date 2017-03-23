=begin

Given a binary tree, convert it to a linked list whose ordering is a pre-order
traversal of the tree.  Use the same node data structure; the nodes in the
linked list will all have left_child == nil and right_child == next node in list.

Example Input:
Node 1
  left: Node 2
    left: Node 3
    right: Node 4
  right: Node 5
    left: Node 6


Example Output:
Node 1
  Node 2
    Node 3
      Node 4
        Node 5
          Node 6

=end

# Simple tree node class, can double as linked list node when left==nil
class Node

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

end

# Utility function to print tree
def print_tree_pre_order(root, depth=0)
  print "  " * depth
  if root != nil
    puts root.value
    print_tree_pre_order(root.left, depth+1)
    print_tree_pre_order(root.right, depth+1)
  else
    puts "nil"
  end
end

# Convert a binary tree to a linked list in pre-order
#
# Pseudocode:

# If there is a left child
#   Push the right child onto a stack to remember it
#   Replace the right child with the left child
#   Set the left child to nil

# If there's a right child (might be the original one if left child was nil,
#   or might be the old left child)
#   Recurse on the right child.
#
# If you get to a node that has no children
#   Pop the stack
#   Set the popped node to the right child
#   Recurse on the right child

def convert_tree(root)

  old_right_stack = []

  convert = lambda do |r|

    if r != nil

      if r.left != nil
        old_right_stack << r.right
        r.right = r.left
        r.left = nil
      end

      if r.right != nil
        convert.call(r.right)
      end

      if r.left == nil && r.right == nil
        if old_right_stack.size > 0
          node = old_right_stack.pop
          r.right = node
          convert.call(r.right)
        end
      end

    end

  end

  convert.call(root)
  return root
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)
root = node1
node1.left = node2
node2.left = node3
node2.right = node4
node1.right = node5
node5.left = node6

puts "Input tree:"
print_tree_pre_order(root)
puts

root = convert_tree(root)

puts "Output linked list:"
print_tree_pre_order(root)
