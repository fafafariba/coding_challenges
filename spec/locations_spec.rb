require 'rspec'
require 'json'
require 'locations_solution'

describe 'Locations' do
	let(:locations) { JSON.generate([{'id': 1, 'name': 'San Francisco Bay Area', 'parent_id': nil}, {'id': 2, 'name': 'San Jose', 'parent_id': 3},{'id': 3, 'name': 'South Bay', 'parent_id': 1}, {'id': 4, 'name': 'San Francisco', 'parent_id': 1}, {'id': 5, 'name': 'Manhattan', 'parent_id': 6}, {'id': 6, 'name': 'New York', 'parent_id': nil}]) }

	let (:results) { "New York\n-Manhattan\nSan Francisco Bay Area\n-San Francisco\n-South Bay\n--San Jose" }

	it 'should place each location and sub location on a new line' do
		expect(locations_organizer(locations).scan("\n").size).to eq(5)
	end
	
	it 'should indent sublocations using a dash' do
		expect(locations_organizer(locations)).to include("-Manhattan")
		expect(locations_organizer(locations)).to include("-San Francisco")
		expect(locations_organizer(locations)).to include("-South Bay")
	end

	it 'should not indent top level locations using a dash' do 
		expect(locations_organizer(locations)).to_not include("-New York")
		expect(locations_organizer(locations)).to_not include("-San Francisco Bay Area")
	end
	
	it 'should double indent sub sub locations using a double dash' do
		expect(locations_organizer(locations)).to include("--San Jose")
	end

	it 'should organize locations on the same level in alphabetical order' do
		expect(locations_organizer(locations)).to eq(results)
	end

	it 'should organize locations up to five indentations deep' do 
		
		five = JSON.generate([{'id': 1, 'name': 'New York', 'parent_id': 3}, {'id': 2, 'name': 'USA', 'parent_id': 4},{'id': 3, 'name': 'East Coast', 'parent_id': 2}, {'id': 4, 'name': 'North America', 'parent_id': 6}, {'id': 5, 'name': 'Manhattan', 'parent_id': 1}, {'id': 6, 'name': 'World', 'parent_id': nil}])
		
		five_results = "World\n-North America\n--USA\n---East Coast\n----New York\n-----Manhattan"

		expect(locations_organizer(five)).to eq(five_results)
	end
	
	
end
