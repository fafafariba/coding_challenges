def isCryptSolution(crypt, solution)
    solution = solution.to_h
    
    word_values = []
    
    crypt.each do |word|
				puts word
        word_value = ""
        (0...word.length).each do |i|
            puts word.length
            if i == 0 && solution[word[i]] == '0' && word.length > 1
                return false
            else
                word_value += solution[word[i]]    
            end 
        end 
        word_values << word_value.to_i
    end
    word_values[0] + word_values[1] == word_values[2]
end

crypt= ["A", "A", "A"]
solution = [["A","0"]]

puts isCryptSolution(crypt, solution)