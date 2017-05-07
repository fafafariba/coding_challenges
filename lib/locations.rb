require 'json'
require 'byebug'

# [ {'id': 1, 'name': 'San Francisco Bay Area', 'parent_id': null},
# 		{'id': 2, 'name': 'San Jose', 'parent_id': 3},
# 		{'id': 3, 'name': 'South Bay', 'parent_id': 1},
# 		{'id': 4, 'name': 'San Francisco', 'parent_id': 1},
# 		{'id': 5, 'name': 'Manhattan', 'parent_id': 6},
# 		{'id': 6, 'name': 'New York', 'parent_id': null} ]

# find top level parents
# sort 
# find children
# sort 

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

	puts locations_sorted.join("\n")

	locations_sorted.join("\n")
	 
	# return "New York\n-Manhattan\nSan Francisco Bay Area\n-San Francisco\n-South Bay\n--San Jose"

	#{3: { "San Jose": 2 }, 6: {"Man" : 4}, 1: {"South Bay": 3, "SF": 5} }
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

