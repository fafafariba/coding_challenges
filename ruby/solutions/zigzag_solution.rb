require 'byebug'

def zigzag(a)
    idx0 = zigzag_with_idx(a, 0)
    idx1 = zigzag_with_idx(a, 1)
    
    return idx0.length > idx1.length ? idx0 : idx1
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

			if zigzag_small?(curr,prev,nex)
					debugger
					if curr_zigzag.empty?
							curr_zigzag << prev
					end
					curr_zigzag << curr
					if i + 1 == a.length
							curr_zigzag << nex
							if curr_zigzag.length > longest_zigzag.length
								longest_zigzag = curr_zigzag
							end
					end
			else
					curr_zigzag << prev
					debugger
					if curr_zigzag.length > longest_zigzag.length
							longest_zigzag = curr_zigzag
					end
					curr_zigzag = []
			end
			i += 2
    end
    return longest_zigzag
end
    

def zigzag_small?(curr, prev, nex)
    curr < prev && curr < nex
end


a = [9, 8, 8, 5, 3, 5, 3, 2, 8, 6]
print zigzag(a)