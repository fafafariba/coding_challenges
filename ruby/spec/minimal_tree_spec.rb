require 'rspec'
require 'minimal_tree'

describe '#minimal_tree' do

	context 'when array is empty' do

		it 'returns nil' do
			expect(minimal_tree([])).to be_nil
		end
	end
	
	context 'when array is even lengthed' do
		let(:arr) { [0, 2, 4, 6, 7, 8] }
		let(:root_val) { 6 }
		let(:root_left_val) { 2 }
		let(:root_right_val) { 8 }
		let(:root_leftmost_val) { 0 }
		
		it 'returns the root' do
			expect(minimal_tree(arr).val).to eq(root_val)
		end

		it 'returns the correct node values' do
			expect(minimal_tree(arr).left.val).to eq(root_left_val)
			expect(minimal_tree(arr).right.val).to eq(root_right_val)
			expect(minimal_tree(arr).left.left.val).to eq(root_leftmost_val)
			expect(minimal_tree(arr).right.right).to be_nil
		end
	end

	context 'when array is odd lengthed' do

		let(:arr) { [1, 3, 5, 7, 9] }
		let(:root_val) { 5 }
		let(:root_left_val) { 3 }
		let(:root_right_val) { 9 }
		
		it 'returns the root' do
			expect(minimal_tree(arr).val).to eq(root_val)
		end

		it 'returns the correct node values' do
			expect(minimal_tree(arr).left.val).to eq(root_left_val)
			expect(minimal_tree(arr).right.val).to eq(root_right_val)
		end
	end
	
end
