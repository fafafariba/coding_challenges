
require 'rspec'
require 'counting_inversions'

describe 'Inversion Count' do
	
	context 'when given an empty array' do

		it 'returns zero' do
			arr = []
			expect(inversion_count(arr).first).to eq(0)
		end
	end

	context 'when given an array length of one' do
			
		it 'returns zero' do
			arr = [5]
			expect(inversion_count(arr).first).to eq(0)
		end
	end

	context 'when given an array with no inversion' do

		it 'returns inversion of 0' do
			arr = [1, 2, 3, 4]
			expect(inversion_count(arr).first).to eq(0)
		end
	end

	context 'when given an array with inversion' do
	
		it 'returns correct count when inversion present' do
			arr = [1, 6, 3, 7, 8, 5]
			expect(inversion_count(arr).first).to eq(4)
		end
	
		it 'returns correct when all elements in the array are inverted' do
			arr = [6, 5, 4, 3, 2, 1]
			expect(inversion_count(arr).first).to eq(15)
		end

	end
	
end
