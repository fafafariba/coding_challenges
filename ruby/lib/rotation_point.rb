  words = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'asymptote', # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage',
]

# Use first word as a reference. Where do the words stop coming after the first word?

def rotation_point(words)
	
	(0...word.length).each do |idx|
		if word[idx] == words.last 
			return idx if words[idx][0] < words[idx-1][0]
			return 0 if words[0][0] < words[idx][0]
		else 
			return idx if words[idx][0] < words[idx-1][0]
		end					
	end
end

def rotation_point(words)
	mid = words.length / 2

	left = words[0...mid]
	right = words[0]
	(0...word.length).each do |idx|
		if word[idx] == words.last 
			return idx if words[idx][0] < words[idx-1][0]
			return 0 if words[0][0] < words[idx][0]
		else 
			return idx if words[idx][0] < words[idx-1][0]
		end					
	end
end


### PRODUCT OF ALL OTHER NUMBERS

def products_of_all_other_nums(array)

	result = Array.new() { [] }