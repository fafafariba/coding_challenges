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

def isListPalindrome l
    length = 0
    node = l
    while not l.nil?
        length += 1
        l = l.next
    end

		[1, 2, 3, 4, 5, 4, 3, 2, 1] = length = 9 / 2 = 4
    
    node = 1
    count = 6
    prev = nil
    while not node.nil?        
        count += 1
        if count > length / 2
            curr_node = node #5_4_3_2_1
            node = node.next #4_3_2_1_nil
            curr_node.next = prev #nil_5_4_3_2
            prev = curr_node #5_4_3_2_1
        else
            l = l.next
        end
    end

    while prev != nil and k != nil
        return false if prev.value != node.value
        prev = prev.next
        k = k.next
    end
    true
end
	

l = ListNode.new(0)
l.next = ListNode.new(1)
l.next.next = ListNode.new(0)
puts isListPalindrome(l)