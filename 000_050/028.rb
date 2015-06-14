# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

# 	21 22 23 24 25
# 	20  7  8  9 10
# 	19  6  1  2 11
# 	18  5  4  3 12
# 	17 16 15 14 13
# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

require "test/unit"

class TestProblem_28 < Test::Unit::TestCase

	def ulam_spiral_diagonals(size)
		half_size = 1+ size/2

		diagonals = []
		diagonals << 0 << 1

		(2..half_size).each do |n|
			last_value_of_prev_circle = diagonals[-1]
			diagonals << last_value_of_prev_circle + 2*(n-1)
			diagonals << last_value_of_prev_circle + 4*(n-1)
			diagonals << last_value_of_prev_circle + 6*(n-1)
			diagonals << last_value_of_prev_circle + 8*(n-1)
		end
		diagonals.delete 0
		diagonals
	end


	def test_sum_of_diagonals_of_ulam_spiral_1001_size
		assert_equal 101, ulam_spiral_diagonals(5).reduce(&:+)
		assert_equal 669171001, ulam_spiral_diagonals(1001).reduce(&:+)
		
	end
end