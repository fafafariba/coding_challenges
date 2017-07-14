def contains_close_nums(nums, k)

    # O(n x m) solution with O(1) space complexity

    # (0...nums.length).each do |i|
    #     j = i + 1
    #     while j <= (i + k) && j < nums.length
    #         return true if nums[i] == nums[j]
    #         j += 1
    #     end
    # end
    # false       
    
    # O(n) solution with O(n) space complexity
    
    idx_counts = Hash.new { |h,k| h[k] = [] }
    nums.each_with_index do |num, idx|
        idx_counts[num] << idx
        if idx_counts[num].length >= 1
            return true if diff_k?(idx_counts[num], k)
        end
    end
    false 
end

def diff_k?(arr, k)
    i = 0
    while i < arr.length - 1 
        j = i + 1
        while j < arr.length
            return true if arr[j] - arr[i] <= k
            j += 1
        end
        i += 1
    end
    false
end
