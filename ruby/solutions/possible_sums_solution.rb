require 'set'
require 'byebug'

calculated = {}
distinct_sums = Set.new 

def possibleSums(coins, quantity)
    set = Hash.new(false)
    set[0] = true
    coins.each_with_index do |var, idx|
			debugger
      set.keys.each do |key|
				debugger
				quantity[idx].times do |i|
					debugger
					set[key + var*(i+1)] = true
				end
      end
    end
    set.size - 1
end
# def possibleSums(coins, quantity)
#     all_coins = get_coins(coins, quantity)
# 		subcombos(all_coins)
# 		distinct_sums
# end

# def get_coins(coins, quantity)
#     result = []
#     quantity.each_with_index do |q, i|
#         q.times do
#             result << coins[i]
#         end
#     end
#     result
# end
    
# def subcombos(arr, combos = [])
# 		if arr.length == 1
# 			combos << arr
# 			return combos
# 		end
#     combos = subcombos(arr[0..-2], combos)
#     last = arr.last
# 		new_combos = []
#     combos.each do |combo|
#       new_combos += subsubcombos(combo, last)
			
#     end
#     combos << [last]
# 		combos.concat(new_combos)
#     return combos.uniq
# end

# def subsubcombos(arr, el)
# 	new_combo = []
# 	(0..arr.length).each do |i|
# 		result = (arr[0...i] + [el] + arr[i..-1])
# 		unless calculated[result.sort]
# 			sum = calculated[result.sort]
# 			distinct_sums << sum unless distinct_sums.include?(sum)
# 		else
# 			calculated[]
				

# 		new_combo << result 
# 	end
# 	new_combo
# end

# coins = [1, 2]
# quantity = [50000, 2]
coins = [10, 50, 100]
quantity = [1, 2, 1]  
print possibleSums(coins, quantity)
# a b c d
    
# a
# b a
# a b
# c a
# a c
# c b a
# b c a
# b a c
# c a b
# a c b
