# The sum of the squares of the first ten natural numbers is,
#   1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#   (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

require "test/unit"

class TestProblem_6 < Test::Unit::TestCase
	def test_difference_between_sum_of_squares_and_square_of_sum
		sum_of_squares = (1..100).map { |x| x**2 }.reduce(&:+)
		square_of_sum = (1..100).reduce(&:+) ** 2
		
		difference = sum_of_squares - square_of_sum
		assert_equal(25164150, difference.abs)		
	end
end