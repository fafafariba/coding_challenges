## Alternate solution in JavaScript: https://repl.it/HTod/1

require 'json'
require 'byebug'

def locations_organizer(locations)
	locations_parsed = JSON.parse(locations)
	top_level_parents = {}
	children = {}

	locations_parsed.each do |location|
		parent_id = location["parent_id"]
		if parent_id
			if children[parent_id]				
				children[parent_id][ location["name"] ] = location["id"]
			else 
				children[parent_id] = { location["name"] => location["id"] }
			end
		else 
			top_level_parents[location["name"]] = location["id"]
		end
	end

	locations_sorted = []
	
	top_level_parents.sort.each do |name, id|
		locations_sorted += [name]
		locations_sorted += child_finder(id, children)
	end

	locations_sorted.join("\n")
end

def child_finder(parent_id, all_children, dashes = 0)
	return [] if all_children[parent_id].nil?
	
	dashes += 1
	sorted_children = []

	all_children[parent_id].sort.each do |name, id| 
		sorted_children += ["-" * dashes + name] 
		sorted_children += child_finder(id, all_children, dashes)
	end 

	sorted_children
end 

