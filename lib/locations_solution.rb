## Alternate solution in JavaScript: https://repl.it/HTod/1

require 'json'
require 'byebug'

def locations_organizer(locations)
	locations_parsed = JSON.parse(locations)
	children = {}

	locations_parsed.each do |location|
		parent_id = location["parent_id"]
		name = location["name"]
		if parent_id
			if children[parent_id]				
				children[parent_id][name] = location["id"]
			else 
				children[parent_id] = { name => location["id"] }
			end
		else 
			if children[0] 
				children[0][name] = location["id"]
			else
				children[0] = { name => location["id"] }
			end
		end
	end

	puts children

	locations_sorted = []
	
	children[0].sort.each do |name, id|
		locations_sorted += [name] + next_children(id, children)
	end

	locations_sorted.join("\n")
end

def next_children(parent_id, all_children, dashes = 1)
	return [] if all_children[parent_id].nil?
	
	sorted_children = []

	all_children[parent_id].sort.each do |name, id| 
		sorted_children += ["-" * dashes + name] 
		sorted_children += next_children(id, all_children, dashes + 1)
	end 

	sorted_children
end 

