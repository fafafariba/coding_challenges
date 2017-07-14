def longest_valid_parentheses(str)
	max_count, right_count, left_count = 0, 0, 0

	(0...str.length).each do |i|
		if str[i] == "("
			right_count += 1
		else
			left_count += 1
		end 

		if left_count > right_count
			max_count = [2 * right_count, max_count].max
			right_count, left_count = 0, 0
		end
	end

	max_count = [
		[right_count, left_count].min * 2, max_count
	].max 

	max_count 
end

p1 = "(()"
p2 = ")()())"
p3 = ")))))())(()()(((((("
p4 = "()(()))))"
p5 = ")(()()()(()()(()()(()(((())))()("
puts longest_valid_parentheses(p1) == 2
puts longest_valid_parentheses(p2) == 4
puts longest_valid_parentheses(p3) == 4
puts longest_valid_parentheses(p4) == 6
puts longest_valid_parentheses(p5)
puts longest_valid_parentheses(p5.reverse)

x = "(
	()()()
	(
		()()
		(
			()()
			(
				()
				(
					(
						(
							()
						)
					)
				)
			()"