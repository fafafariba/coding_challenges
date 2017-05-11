require 'rspec'
require 'merge_sort'

describe 'Merge Sort' do 
	
	context 'when given an empty array' do

		it 'returns an empty array' do
			expect(merge_sort([])).to eq([])
		end
	end

	context 'when given an array length of one' do
			
		it 'returns that array' do
			expect(merge_sort([4])).to eq([4])
		end
	end

	context 'when given a longer array' do

		it 'sorts an even length array' do
			arr = [1, 3, 5, 2]
			expect(merge_sort(arr)).to eq([1, 2, 3, 5])
		end
	
		it 'sorts an even length array' do
			arr = [1, 3, 5, 2, 0]
			expect(merge_sort(arr)).to eq([0, 1, 2, 3, 5])
		end
	
		it 'sorts an array with duplicates' do
			arr = [2, 1, 3, 3, 5, 2]
			expect(merge_sort(arr)).to eq([1, 2, 2, 3, 3, 5])
		end
	end
	
end
