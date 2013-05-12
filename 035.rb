require "test/unit"

require_relative 'tools/numbers'

class Test_Problem35 < Test::Unit::TestCase

	def test_circular_primes_below_one_million
		primes = Fixnum.primes.to_a
		primes = primes_without_even_digits << 2
		circular_primes =  primes.select { |prime| prime.circular_prime? }
		p circular_primes
		assert_equal 55, circular_primes.count
	end
end