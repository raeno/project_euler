require 'test/unit'

require_relative 'tools/numbers'
# A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large:
# one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
# Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?

class Test_Problem56 < Test::Unit::TestCase

	def test_max_sum_of_digits
		max = 1
		(2..100).each do |a|
			(2..100).each do |b|
				sum = (a**b).sum_of_digits
				max = sum if sum > max
			end
		end
		assert_equal 972, max
	end
end