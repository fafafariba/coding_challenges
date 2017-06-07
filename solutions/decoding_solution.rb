# You are an FBI agent and you need to determine the total number of ways that the message can be decoded.

# Since the answer could be very large, take it modulo 109 + 7.

# Example

# For message = "123", the output should be

# mapDecoding(message) = 3.

# "123" can be decoded as "ABC" (1 2 3), "LC" (12 3) or "AW" (1 23), so the total number of ways is 3.


def mapDecoding(message, i = 0, memo = {})
    if message == "" 
        0
    elsif i == message.length 
        1
    end 
    
    count = 0
    if memo[i]
        count += memo[i]
    else
        if valid?(message[i])
            count += mapDecoding(message, i + 1, memo)
        end 

        if valid?(message[i..i + 1]) && i < message.length - 1
            count += mapDecoding(message, i + 2, memo) 
        end
        
        memo[i] = count
    end
    count 
end

def valid?(str)
    if str.length == 2
        str.to_i.between?(10, 26)
    else
        str.to_i.between?(1, 9)
    end
end

# Dynamic Programming solution

def mapDecoding(message)
    return 1 if message.length.zero?

    dp = Array.new(message.length) { 0 }

    (0...message.length).each do |i|
        if i == 0
            unless message[i] == "0"
                dp[i] = 1
            else
                dp[i] = 0
            end
        elsif i == 1 
            unless message[i] == "0"
                dp[i] = dp[i - 1]
            end

            if valid?(message[i-1..i])
                dp[i] += 1
            end
        else
            unless message[i] == "0"
                dp[i] = dp[i - 1]
            end

            if valid?(message[i-1..i])
                dp[i] += dp[i - 2]
            end
        end
    end
    dp.last
end

puts mapDecoding("1221112111122221211221221212212212111221222212122221222112122212121212221212122221211112212212211211")

puts mapDecoding("1")