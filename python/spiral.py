def matrixElementsInSpiralOrder(matrix):
	x_min = 0
	y_min = 0
	x_max = len(matrix) - 1
	y_max = len(matrix[0]) - 1
	x = 0
	y = 0
	spiral = []
	target_len = x_max * y_max

	while in_bounds(x_min, x_max, y_min, y_max):
		while y <= y_max and in_bounds(x_min, x_max, y_min, y_max):
			spiral.append(matrix[x][y])
			print([x, y])
			if y == y_max:
				x += 1
				x_min += 1
				break 
			else:
				y += 1
		print("x_min", x_min)

		while x <= x_max and in_bounds(x_min, x_max, y_min, y_max):
			spiral.append(matrix[x][y])
			print([x, y])
			if x == x_max:
				y -= 1
				y_max -= 1
				break
			else:
				x += 1
		print("y_max", y_max)

		while y >= y_min and in_bounds(x_min, x_max, y_min, y_max):
			spiral.append(matrix[x][y])
			print([x,y])
			if y == y_min:
				x -= 1
				x_max -= 1
				break
			else:
				y -= 1
		print("x_max", x_max)

		while x >= x_min and in_bounds(x_min, x_max, y_min, y_max):
			spiral.append(matrix[x][y])
			print([x,y])
			if x == x_min:
				y += 1 
				y_min += 1
				break
			else:
				x -= 1
		print("y_min", y_min)
	return spiral

def in_bounds(x_min, x_max, y_min, y_max):
	return x_min <= x_max and y_min <= y_max

matrix = [ [ 1, 2, 3 ], [ 8, 9, 4 ], [ 7, 6, 5 ] ]

matrix2 = [ 
	[ 1, 2, 3, 4 ], 
	[ 12, 13, 14, 5 ], 
	[ 11, 16, 15, 6 ], 
	[ 10, 9, 8, 7 ] 
	]

matrix3 = [
	[1, 2, 3],
	[10, 11, 4],
	[9, 12, 5],
	[8, 7, 6]
]


print(matrixElementsInSpiralOrder(matrix))
