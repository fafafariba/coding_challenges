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

	next_children(0, children).join("\n")
end

def next_children(parent_id, children, dashes = 0)
	return [] if children[parent_id].nil?
	
	organized_locations = []

	children[parent_id].sort.each do |name, id| 
		organized_locations += ["-" * dashes + name] + next_children(id, children, dashes + 1)
	end 

	organized_locations
end 

