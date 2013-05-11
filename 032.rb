require "test/unit"

require_relative 'tools/numbers'
require 'set'

class Test_Problem32 < Test::Unit::TestCase

	def all_permutations
		(1..9).to_a.permutation(9).map { |v| v.join('')}
	end

	def find_such_products
		products = Set.new
		permutations = all_permutations

		(1..7).each do |first|
			(1..8-first).each do |second|
				permutations.each do |perm|
					# p first 
					# p second
					perm_string = perm.to_s
					# p perm_string
					multi_1 = perm_string[0...first].to_i
					multi_2 = perm_string[first...first+second].to_i
					product = perm_string[first+second..9].to_i

					products << product if multi_1 * multi_2 == product
					# p multi_1
					# p multi_2
					# p product
				end
			end
    end

   products
	end


	def test_products_which_with_multiplier_and_multiplicand_is_permutation_of_1_to_9
		products = find_such_products
		p products
		p products.reduce(0) { |mem,var| mem += var}
		
	end
end