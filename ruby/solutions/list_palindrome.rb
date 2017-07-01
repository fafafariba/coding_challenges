# Definition for singly-linked list:
class ListNode
  attr_accessor :value, :next
  def initialize(val)
    @value = val
    @next = nil
	end
end

# def isListPalindrome(l)
#     length = 0
#     node = l
#     until node.nil?
#         length += 1
#         node = node.next
#     end
		
# 		pos1 = 0
# 		pos2 = length - 1
# 		until pos1 == pos2 || pos1 > pos2
			
# 			node1, node2 = l, l
# 			pos1.times { node1 = node1.next }
# 			pos2.times { node2 = node2.next }
		
# 			return false if node1.value != node2.value
			
# 			pos1 += 1
# 			pos2 -= 1
# 		end

# 		true 
# end

#Alternative solution

def isListPalindrome(l)
    return true if l.nil? || l.next.nil?
    
    mid = find_mid(l)
    l2 = reverse_list(mid)
    curr1 = l
    curr2 = l2
    while !curr2.nil?
        return false if curr1.value != curr2.value
        curr1 = curr1.next
        curr2 = curr2.next
    end
    true 
end

def find_mid(list)
    slow_marker = list
    fast_marker = list.next
    while !fast_marker.nil? && !fast_marker.next.nil?
        slow_marker = slow_marker.next
        fast_marker = fast_marker.next.next
    end
    slow_marker.next
end

def reverse_list(curr_node)
    prev_node = nil
    while !curr_node.nil?
        next_node = curr_node
        curr_node = curr_node.next
        next_node.next = prev_node
        prev_node = next_node
    end
    prev_node
end
	

l = ListNode.new(1)
l.next = ListNode.new(2)
l.next.next = ListNode.new(3)
l.next.next.next = ListNode.new(4)
l.next.next.next.next = ListNode.new(2)
l.next.next.next.next.next = ListNode.new(1)
puts isListPalindrome(l)