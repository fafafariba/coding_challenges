def karatsuba(n1, n2)

	# base case n1 and n2 single digits
	return n1 * n2 if n1 < 10 && n2 < 10
	
	length = [n1.to_s.length.to_i, n2.to_s.length.to_i].max
	half = length/2
	
	x1 = n1 / (10**half)
	x2 = n1 % (10**half)
	y1 = n2 / (10**half)
	y2 = n2 % (10**half)
	
	a = karatsuba(x1, y1)
	c = karatsuba(x2, y2)
	b = karatsuba(x1 + x2, y1 + y2) - a - c

	a * (10**(2*half)) + b * (10**half) + c
end