require 'rspec'
require 'angellist_locations'

describe Locations do
	let(:locations) { [
		{'id': 1, 'name': 'San Francisco Bay Area', 'parent_id': null},
		{'id': 2, 'name': 'San Jose', 'parent_id': 3},
		{'id': 3, 'name': 'South Bay', 'parent_id': 1},
		{'id': 4, 'name': 'San Francisco', 'parent_id': 1},
		{'id': 5, 'name': 'Manhattan', 'parent_id': 6},
		{'id': 6, 'name': 'New York', 'parent_id': null},
		] }
	let (:results) {
		"New York
		-Manhattan
		San Francisco Bay Area
		-San Francisco
		-South Bay
		--San Jose"
	}

	describe 'locations_organizer' do
		let(:organized_cities) { locations_organizer(:locations) }
		
		it 'should indent sublocations using a dash' do
			expect(locations_organizer(:locations)).to include("-Manhattan")
			expect(locations_organizer(:locations)).to include("-San Francisco")
			expect(locations_organizer(:locations)).to include("-South Bay")
		end
		
		it 'should double indent sub sub locations using a double dash' do
			expect(locations_organizer(:locations)).to include("--San Jose")
		end

		it 'should organize cities under areas' do
			expect(locations_organizer(:locations)).to eq(:results)
		end
		
	end
	
end
