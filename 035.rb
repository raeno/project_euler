require "test/unit"

require_relative 'tools/numbers'

class Test_Problem35 < Test::Unit::TestCase
	def test_circular_primes_below_one_million
		primes = Fixnum.primes
		circular_primes =  primes.select { |prime| prime.circular_prime? }
		assert_equal 22, circular_primes.count
	end
end
