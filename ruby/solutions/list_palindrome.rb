# Definition for singly-linked list:
class ListNode
  attr_accessor :value, :next
  def initialize(val)
    @value = val
    @next = nil
	end
end

def isListPalindrome(l)
    length = 0
    node = l
    until node.nil?
        length += 1
        node = node.next
    end
		
		pos1 = 0
		pos2 = length - 1
		until pos1 == pos2 || pos1 > pos2
			
			node1, node2 = l, l
			pos1.times { node1 = node1.next }
			pos2.times { node2 = node2.next }
		
			return false if node1.value != node2.value
			
			pos1 += 1
			pos2 -= 1
		end

		true 
end

#Alternative solution

def isListPalindrome(l)
    return true if l.nil? || l.next.nil?
    
    mid = find_mid(l)
    l2 = reverse_list(mid)
    curr1 = l
    curr2 = l2
    while !curr2.nil?
        if curr1.value != curr2.value
            return false
        end
        curr1 = curr1.next
        curr2 = curr2.next
    end
    true 
end

def find_mid(list)
    count = 1
    slow_marker = list
    fast_marker = list.next
    while !fast_marker.nil? && !fast_marker.next.nil?
        slow_marker = slow_marker.next
        count += 1
        fast_marker = fast_marker.next.next
    end
    slow_marker.next
end

def reverse_list(curr)
    prev_node = nil
    next_node = nil
    while !curr.nil?
        next_node = curr.next 
        curr.next = prev_node
        prev_node = curr
        curr = next_node
    end
    prev_node
end
	

l = ListNode.new(0)
l.next = ListNode.new(1)
l.next.next = ListNode.new(0)
puts isListPalindrome(l)