# Surprisingly there are only three numbers that can be written as the sum of fourth powers
# of their digits:
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth powers of their
# digits.

require "test/unit"



class TestProblem_30 < Test::Unit::TestCase

	def map_number_to_sum_of_its_digits_in_fifth_power(limit)
		Hash[(1..limit).map { |n| [n, n.to_s.chars.map(&:to_i).reduce(0){ |mem, var| mem += var**5}]}]
	end

	def test_sum_of_all_the_numbers_that_is_the_sum_of_fifth_powers_of_their_digits
		values = map_number_to_sum_of_its_digits_in_fifth_power(1000000)

		selected = values.select { |k,v| k == v }
		selected.delete(1)
		sum = selected.keys.reduce(0) { |mem, var| mem += var}
		
		assert_equal 443839, sum
	end
end