require "test/unit"
require_relative 'tools/numbers'

class Test_Problem37 < Test::Unit::TestCase
	def find_truncatable_primes
		primes = Fixnum.primes.to_a
		[2,3,5,7].each { |v| primes.delete v }
		primes.select { |p| p.truncatable_prime? }
	end

	def test_sum_of_eleven_truncatable_primes
		assert_equal 748317, find_truncatable_primes.reduce(0) {|mem,var| mem += var }
	end
end