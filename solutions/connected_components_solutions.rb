require 'pry'
puts "x"
puts Dir.pwd
puts "x"
def connected_components (lines)
	puts lines

	binding.pry
end

file = File.readlines('/Users/fafafariba/Desktop/App Academy/coding_challenges/files/connected_components_file.txt')

connected_components(file)
