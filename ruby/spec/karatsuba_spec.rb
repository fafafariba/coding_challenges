require 'rspec'
require 'karatsuba'

describe 'Karatsuba Multiplication' do

	it 'multiplies two zeros' do 
		expect(karatsuba(0, 0)). to eq(0)
	end

	it 'multiplies two single digit numbers' do
		expect(karatsuba(4, 9)).to eq(36)
	end

	it 'multiplies two multi digit numbers' do
		expect(karatsuba(1234, 4321)).to eq(5332114)
	end
		
	it 'multiples two long mutli digit numbers' do
		expect(karatsuba(3141592653589793238462643383279502884197169399375105820974944592, 
		2718281828459045235360287471352662497757247093699959574966967627)).to eq(8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184)
	end

	it 'multiples two multi digit numbers of differing lengths' do
		expect(karatsuba(966967627, 837)). to eq(809351903799)
	end
end
