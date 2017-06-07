# You are an FBI agent and you need to determine the total number of ways that the message can be decoded.

# Since the answer could be very large, take it modulo 109 + 7.

# Example

# For message = "123", the output should be

# mapDecoding(message) = 3.

# "123" can be decoded as "ABC" (1 2 3), "LC" (12 3) or "AW" (1 23), so the total number of ways is 3.

def mapDecoding(message, combos = 0)

	#base case 
	if message.length == 2
	if message.to_i.between?(1, 26)
		message != "0"
		return true
	else
		retur

	
    combos = 0
    i = 0
    while i < message.length
        combos += 1
        next_num = message[i+1]
        unless next_num.nil?
            if next_num == "0"
                i += 2
            else
                combos +=1 if  message[i..i+1].to_i <= 26
								i += 1
            end
        end
    end
    combos
end
