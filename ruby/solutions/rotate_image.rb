require 'byebug'

def rotateImage(a, shift = 0)
    return a if done?(a.length, shift)
    
    n = a.length
    (shift...n - shift - 1).each do |i|
        curr_x = shift
        curr_y = i
				curr = a[curr_x][curr_y]
				debugger if shift > 0
        4.times do
            rot_x = curr_y
            rot_y = n - curr_x - 1
            nex = a[rot_x][rot_y]
            a[rot_x][rot_y] = curr
						curr_x = rot_x
						curr_y = rot_y
						curr = nex 
        end
				# print a
				# print "\n"
    end
		rotateImage(a, shift += 1)
    a
end
        
def done?(length, shift)
    length +=1 if length % 2 == 0
    
    shift > (length / 2) ? true : false
end

a = [[10,9,6,3,7], 
 [6,10,2,9,7], 
 [7,6,3,8,2], 
 [8,9,7,9,9], 
 [6,8,6,8,2]]

print rotateImage(a) 