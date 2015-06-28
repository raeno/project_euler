# Problem #1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'test/unit'
require "minitest/benchmark" 

class TestProblem_1 < Test::Unit::TestCase

	def find_all_multiples(limit)
		(1..limit-1).select { |n| n % 3 == 0  or n % 5 == 0}.reduce(:+)
	end

	def find_mathematically(limit)
	 	three, five, fifteen =  [3,5,15].map do |num|
	 		count = (limit - 1) / num
	 		num * count * (count +1) / 2
	 	end
	 	three + five - fifteen
	end


	def test_sum_of_all_multiples_of_3_and_5
		sum = find_all_multiples(1000)
		assert_equal 233168, sum
	end

	def test_mathematical_solution
		sum = find_mathematically 1000
		assert_equal 233168, sum
	end

	def test_performance
		 assert_performance_linear 0.9999 do |n| # n is a range value
      		100.times { find_all_multiples n }
    	end

    	assert_performance_constant 0.9999 do |n|
    		100.times { find_mathematically n }
    	end
	end
end
