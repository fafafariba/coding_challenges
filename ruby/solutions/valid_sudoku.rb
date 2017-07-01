require 'byebug'

def sudoku2(grid)
    x = 0
    y = 0
    while x < grid.length && y < grid.first.length
        if grid[x][y] != "."
            return false unless check_row(grid, x, y)
            return false unless check_col(grid, x, y)
            return false unless check_sq(grid, x, y)
        end
        unless y + 1 == grid.first.length
            y += 1
        else
            x += 1
            y = 0 
        end    
    end
    true 
end

def check_row(grid, x, y)
    curr = grid[x][y]
    y += 1
    while y < grid.first.length
        return false if curr == grid[x][y]
        y += 1
    end
    true
end

def check_col(grid, x, y)
    curr = grid[x][y]
    x += 1
    while x < grid.length
        return false if curr == grid[x][y]
        x += 1
    end
    true 
end

def check_sq(grid, x, y)
    range_x = get_range(x)
    range_y = get_range(y)
    curr = grid[x][y]
    (range_x.first .. range_x.last).each do |i|
        if i != x
            (range_y.first .. range_y.last).each do |j|
                if j != y
                    return false if curr == grid[i][j]
                end
            end
        end
    end 
    true 
end

def get_range(z)
    if z.between?(0,2)
        return [0,2]
    elsif z.between?(3, 5)
        return [3, 5]
    else
        return [6, 8]
    end
end

g = [[".",".",".","1","4",".",".","2","."], 
 [".",".","6",".",".",".",".",".","."], 
 [".",".",".",".",".",".",".",".","."], 
 [".",".","1",".",".",".",".",".","."], 
 [".","6","7",".",".",".",".",".","9"], 
 [".",".",".",".",".",".","8","1","."], 
 [".","3",".",".",".",".",".",".","6"], 
 [".",".",".",".",".","7",".",".","."], 
 [".",".",".","5",".",".",".","7","."]]

print sudoku2(g)