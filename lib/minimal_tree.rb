# Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height

class TreeNode
	attr_accessor :left, :right
	attr_reader :val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end
end

def minimal_tree(arr)
	return nil if arr.length <= 0

	mid = arr.length / 2
	node = TreeNode.new(arr[mid])
	left = arr[0...mid]
	right = arr[mid + 1..-1]
	node.left = minimal_tree(left)
	node.right = minimal_tree(right)
	node
end
