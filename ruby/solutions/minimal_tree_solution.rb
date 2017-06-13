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