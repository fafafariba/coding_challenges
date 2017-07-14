
def walk_keyboard(str)
	alpha = {
		a: [0,0], b: [0,1], c: [0,2], 
		d: [1,0], e: [1,1], f: [1,2], 
		g: [2,0], h: [2,1], i: [2,2], 
		j: [3,0], k: [3,1], l: [3,2], 
		m: [4,0], n: [4,1], o: [4,2], 
		p: [5,0], q: [5,1], r: [5,2], 
		s: [6,0], t: [6,1], u: [6,2], 
		v: [7,0], w: [7,1], x: [7,2], 
		y: [8,0], z: [8,1]
	}
    
    result = ""
    prev = [0,0]
    (0...str.length).each do |i|
        letter = str[i]
        return "" unless alpha[letter.to_sym]
          
        curr = alpha[letter.to_sym]
        dy = curr[1] - prev[1]

        if dy > 0
            dy.times { result << "R" }
        elsif dy < 0
            (dy * -1).times { result << "L" }
        end
        
        dx = curr[0] - prev[0]

        if dx > 0
            dx.times { result << "D" } 
        elsif dx < 0
            (dx * -1).times { result << "U" }
        end

        result += "-"
        prev = curr
    end
        
    result
end

puts walk_keyboard("bad") == "R-L-D-"
puts walk_keyboard("") == ""
puts walk_keyboard("aaaaaaa") == "-------"
