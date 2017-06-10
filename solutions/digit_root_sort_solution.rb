def digitRootSort(a)
    return a if a.length <= 1
    
    mid = a.length/2
    left = a[0...mid]
    right = a[mid..-1]
    
    left_sorted = digitRootSort(left)
    right_sorted = digitRootSort(right)
    
    merge(left_sorted, right_sorted)
end

def merge(left, right)
    
    result = []
    
    i, j = 0, 0
    
    while i < left.length && j < right.length
        if digitalroot(left[i]) < digitalroot(right[j])
            result << left[i]
            i += 1
        elsif digitalroot(right[j]) < digitalroot(left[i])
            result << right[j]
            j += 1
        else
            if left[i] < right[j]
                result << left[i]
                i += 1
            else
                result << right[j]
                j += 1
            end
        end
    end
    
    result + left[i..-1] + right[j..-1]
end


def digitalroot(n)
    until n.to_s.length == 1
        sum = 0
        n.to_s.split("").each do |n|
					puts n
            sum += n.to_i
        end
        n = sum
    end
    n
end