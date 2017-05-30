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
end
