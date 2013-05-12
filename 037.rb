require "test/unit"
require_relative 'tools/numbers'

class Test_Problem37 < Test::Unit::TestCase
	def test_sum_of_eleven_truncatable_primes

		#Fixnum.primes = eratosthenes 10**7

		primes = primes_without_even_digits
		[2,3,5,7].each { |v| primes.delete v }

		primes = primes.select { |p| p.truncatable_prime? }

		p primes
		p primes.count
		
	end
end