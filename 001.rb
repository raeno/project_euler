# Problem #1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'test/unit'

class TestProblem_1 < Test::Unit::TestCase

	def test_sum_of_all_multiples_of_3_and_5
		sum = (1..999).select { |n| n % 3 == 0  or n % 5 == 0}.reduce(:+)
		assert_equal 233168, sum
	end
end