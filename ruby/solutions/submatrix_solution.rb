def constructSubmatrix(matrix, rowsToDelete, columnsToDelete)
    r = rowsToDelete
    c = columnsToDelete

		new_matrix = Array.new(matrix.length - r.length) { Array.new(matrix.first.length - c.length, 0) }

		x1 = 0
    y1 = 0

    (0...matrix.length).each do |x|
        (0...matrix.first.length).each do |y|
            if r.include?(x) || c.include?(y)
                new_matrix[x1][y1] = matrix[x][y]
								if y1 + 1 < new_matrix.first.length
									y1 += 1
								else
									x1 += 1
									y1 = 0
								end
            end 
        end
    end
    new_matrix
end

matrix= [[1,0,0,2], 
 [0,5,0,1], 
 [0,0,3,5]]
rowsToDelete= [1]
columnsToDelete= [0, 2]

constructSubmatrix(matrix, rowsToDelete, columnsToDelete)