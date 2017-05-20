require 'byebug'

def inversion_count(array)
	return [0, array] if array.length <= 1

	mid = array.length / 2
	left = array[0...mid]
	right = array[mid..-1]

	left_sorted = inversion_count(left)
	right_sorted = inversion_count(right)

	merged_sorted = merge_and_count(left_sorted[1], right_sorted[1])

	[left_sorted.first + right_sorted.first + merged_sorted.first, merged_sorted[1]]

end

def merge_and_count(left, right)
	inversions = 0
	merged = []

	i, j = 0, 0

	until i == left.length || j == right.length

		if left[i] < right[j]
			merged << left[i]
			i += 1
		else
			merged << right[j]
			inversions += left.length - i
			j += 1
		end
	end
	merged.concat(left[i..-1]).concat(right[j..-1])

	[inversions, merged ]
end
