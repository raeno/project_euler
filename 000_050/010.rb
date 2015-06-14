# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require "test/unit"
require_relative 'tools/prime_numbers'

class TestProblem_10 < Test::Unit::TestCase
	def test_sum_of_all_prime_numbers_below_two_million
		assert_equal 142913828922, eratosthenes(2*(10**6)).reduce(&:+)	
	end
end