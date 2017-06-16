# Given a pattern and a string input - find if   the string follows the same pattern and return 0 or 1. Examples: 1) Pattern : "abba", input: "redblueredblue" should return 1. 2) Pattern: "aaaa", input: "asdasdasdasd" should return 1. 3) Pattern: "aabb", input: "xyzabcxzyabc" should return 0.

# def follows_pattern?(pattern, input)
# 	return 0 unless input.length % patern.length == 0
# 	matches = {}

# 	(0...input.length).each_char do |i|
# 		if matches.include?(input[i])
		
# 		else
# 			matches[char] = 


def follows_pattern?(pattern, str, i = 0, j = 0)
	# pattern_map = Hash.new(0)
	# pattern.each_char do |char|
	# 	pattern_map[char] += 1
	# end

	(0...str.length).each do |i|
		a = str[0..i]
		(i + 1...str.length).each do |j|
			b = str[i + 1 .. j]
			return true if match?(pattern, str, a, b)
		end
	end
	false
end

def match?(pattern, str, a, b)
	new_str = ""
	pattern.each_char do |char|
		new_str += char == "a" ? a : b
	end
	new_str == str
end

puts follows_pattern?("abab", "redblueredblue")
puts follows_pattern?("aaaa", "asdasdasdasd")
puts follows_pattern?("aabb", "xyzabcxzyabc")


def follows_pattern?(pattern, str, map = {})
	return true if pattern.length == 0 && str.length == 0
	return false if pattern.length == 0 || str.length == 0

	if map[pattern]
		
		if match 
			return true
		else
			return false
		end

	else 
		new_pattern = pattern[1, -1]

	

end 

def _recurse()
