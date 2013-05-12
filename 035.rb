require "test/unit"

require_relative 'tools/numbers'

class Test_Problem35 < Test::Unit::TestCase

	def primes_without_even_digits
		primes = Fixnum.primes
		even_chars = [0,2,4,6,8].map(&:to_s)
		primes = primes.select { |p| !(p.to_s.chars & even_chars).any? }
	end

	def test_circular_primes_below_one_million
		primes = primes_without_even_digits << 2
		circular_primes =  primes.select { |prime| prime.circular_prime? }
		assert_equal 22, circular_primes.count
	end
end