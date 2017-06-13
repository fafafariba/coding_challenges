require 'set'
require 'byebug'

# Questions: 
# Can I avoid storing board in a variable?
# If I find lengths of words and startings points
# Since size of the grid is fixed, we could calculate positions via index, but would have iterate more

class Crossword

	attr_accessor :board, :words, :start_coordinates
	attr_reader :puzzle

	def initialize(puzzle)
		@puzzle = puzzle
		@board
		@start_coordinates = Array.new 
		@words = Hash.new
	end

	def execute
		setup
		find_starting_coordinates
		place_words
		# check_words
		render
	end

	def setup
		dividing_idx = /[A-Z]/ =~ puzzle
		@board = puzzle[0...dividing_idx].split("\n").map { |el| el.split("") }
		puzzle[dividing_idx..-1].split(";").each do |word|
			if words[word.length]
				words[word.length] << word
			else
				words[word.length] = [word]
			end
		end
	end

	def find_starting_coordinates
		
		# find coordinates of blank spaces
		(0...10).each do |row|
			(0...10).each do |col|
				if board[row][col] === "-"

					# vertical first letter
					if board[row - 1][col] != "-" && board[row + 1][col] === "-"
						length = length_finder([row,col], "vertical")
						start_coordinates << { coord: [row, col], dir: "vertical", length: length }
					end 

					# horizontal first letter
					if board[row][col - 1] != "-" && board[row][col + 1] === "-"
						length = length_finder([row,col], "horizontal")
						start_coordinates << { coord: [row, col], dir: "horizontal", length: length }
					end
				end 
			end 
		end
	end 
		
	def place_words

		# place unique lengthed words first
		words.keys.each do |key|
			if words[key].length === 1
				match = find_space_match(key).first
				add_to_board(words[key].first, match[:coord], match[:dir])
			end
		end

		# check from longest to shortest
		words.keys.sort.reverse.each do |key|
			if words[key].length > 1
				matches = find_space_match(key)
				test_board(words[key], matches)
			end
		end
	end

	def render
		board.each do |line|
			puts "#{line.join("")}"
		end
	end

	private

	def length_finder(pos, dir)
		length = 0
		x = pos[0]
		y = pos[1]
		
		while x < 10 && y < 10 && board[x][y] === "-" 
			length += 1
			y += 1 if dir === "horizontal"
      x += 1 if dir === "vertical"
		end 

		length 
	end

	def find_space_match(length)
		match = []
		start_coordinates.each do |coord|
			if coord[:length] === length
				match << { dir: coord[:dir], coord: coord[:coord] }
			end 
		end
		match
	end
	
	def add_to_board(word, pos, dir)
		x = pos[0]
		y = pos[1]
		word.chars do |char|
			board[x][y] = char
			dir === "horizontal" ? y += 1 : x += 1
		end
	end

	def test_board(words, word_spaces)
		intersections = {}
		no_intersections = []
		length = words.first.length

		word_spaces.each do |word_space|
			x = word_space[:coord][0]
			y = word_space[:coord][1]
			dir = word_space[:dir]
			num_intersects = 0 

			length.times do
				num_intersects += 1 if  board[x][y] != "-"
				dir === "horizontal" ? y += 1 : x += 1
			end 

			if num_intersects.zero?
				no_intersections << word_space
			else
				intersections[num_intersects] = word_space
			end
		end

		intersections.keys.sort.reverse.each do |key|
			space = intersections[key]
			x = space[:coord][0]
			y = space[:coord][1]
			dir = space[:dir]
			words.each do |word|
				add_to_board(word, [x, y], dir) if word_match?(word, x, y, dir)
			end
		end

		no_intersections.each do |el|
			x = el[:coord][0]
			y = el[:coord][1]
			dir = el[:dir]
			words.each do |word|
				add_to_board(word, [x, y], dir) if word_match?(word, x, y, dir)
			end
		end

	end



	def word_match?(word, x, y, dir, i = 0)
		return true if i === word.length 

		if board[x][y] === "-" || board[x][y] === word[i]
			if dir === "horizontal"
				word_match?(word, x, y + 1, dir, i + 1)
			else
				word_match?(word, x + 1, y, dir, i + 1)
			end
		else
			return false
		end
	end

end 

input = "+-++++++++
+-++++++++
+-++++++++
+-----++++
+-+++-++++
+-+++-++++
+++++-++++
++------++
+++++-++++
+++++-++++
LONDON;DELHI;ICELAND;ANKARA"

input2 = "+-++++++++
+-++++++++
+-------++
+-++++++++
+-++++++++
+------+++
+-+++-++++
+++++-++++
+++++-++++
++++++++++
AGRA;NORWAY;ENGLAND;GWALIOR"

Crossword.new(input).execute



				# y += 1
			# elsif puzzle[i] === "-"
			# 	board[x][y] = "-"
				
				# #saves space
				# prev_x = i - 11
				# next_x = i + 11
				# prev_y = i - 1
				# next_y = i + 1

				# if puzzle[prev_x] != "-" && puzzle[next_x] === "-"
				# 	start_coordinates[[x,y]] = { dir: "vertical"}
				# end

				# if puzzle[prev_y] != "-" && puzzle[next_y] === "-"
				# 	start_coordinates[[x,y]] = { dir: "horizontal"}
				# end 
				
				# y += 1
		# end 

	# def find_length
	# 	start_coordinates.keys.each do |key|
	# 		length = length_helper(key, start_coordinates[key][:dir])
	# 		start_coordinates[key][:length] = length
	# 	end 
	# end  