# Given a pattern and a string input - find if   the string follows the same pattern and return 0 or 1. Examples: 1) Pattern : "abba", input: "redblueredblue" should return 1. 2) Pattern: "aaaa", input: "asdasdasdasd" should return 1. 3) Pattern: "aabb", input: "xyzabcxzyabc" should return 0.

def follows_pattern?(pattern, input)
	return 0 unless input.length % patern.length == 0
	matches = {}

	(0...input.length).each_char do |i|
		if matches.include?(input[i])
		
		else
			matches[char] = 