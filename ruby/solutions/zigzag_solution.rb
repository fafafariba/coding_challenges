require 'byebug'

def zigzag(a)
    idx0 = zigzag_with_idx(a, 0)
    idx1 = zigzag_with_idx(a, 1)
    return idx0.length > idx1.length ? idx0.length : idx1.length
end

def zigzag_with_idx(a, idx)
    longest_zigzag = []
    curr_zigzag = []
		i = idx
		while i < a.length 
			curr = a[i]
			if i == 0
				prev = -1
				nex = a[i+1]
			elsif i == a.length - 1
				prev = a[i-1]
				nex = -1
			else
				prev = a[i-1]
				nex = a[i+1]
			end

			if zigzag_left?(curr, prev) && zigzag_right?(curr, nex)
				# debugger
				curr_zigzag.concat([prev, curr])
				if i + 1 == a.length
					if zigzag_right?(curr, nex) 
						curr_zigzag << nex
						if curr_zigzag.length > longest_zigzag.length
							longest_zigzag = curr_zigzag
						end
					end
				end
			else
				# debugger
				curr_zigzag << prev
				if zigzag_left?(curr, prev)
					curr_zigzag << curr 
				end
				if curr_zigzag.length > longest_zigzag.length
						longest_zigzag = curr_zigzag
				end
				curr_zigzag = []
			end
			i += 2
    end
    return longest_zigzag
end
    

def zigzag_left?(curr, prev)
    curr < prev 
end

def zigzag_right?(curr, nex)
	curr < nex
end


a = [9, 8, 8, 5, 3, 5, 3, 2, 8, 6]
puts zigzag(a) == 4
b = [4, 4]
puts zigzag(b) == 1
c = [2, 1, 4, 4, 1, 4, 4, 1, 2, 0, 1, 0, 0, 3, 1, 3, 4, 1, 3, 4]
puts zigzag(c) == 6