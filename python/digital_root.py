

def digit_sum(n):
	if n < 10: return n

	exp = 0
	temp_n = n
	while temp_n >= 10:
		exp += 1
		temp_n /= 10 
	sum = 0
	while exp >= 0:
		sum += n / (10**exp)
		n %= (10**exp)
		exp -= 1
	return digit_sum(sum)
	
print digit_sum(9999)
print digit_sum(434)
print digit_sum(3)
print digit_sum(14)
print digit_sum(1000)
