def merge_sort(arr)
	return arr if array.length <= 1

	mid = arr.length/2
	left = arr[0...mid]
	right = arr[mid..-1]

	left_sorted = merge_sort(left)
	right_sorted = merge_sort(right)

	merge(left_sorted + right_sorted)

end

def merge(left, right)

	merged = []

	l = 0
	r = 0

	until l == left.length || r == right.length
		if left[l] <= right[r]
			merged << left[l]
			l += 1
		else 
			merged << right[r]
			r += 1
		end

		merged + left[l..-1] + right[r..-1]
end


