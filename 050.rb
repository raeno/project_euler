require "test/unit"

require_relative "tools/numbers"

class TestProblem_50 < Test::Unit::TestCase

	def all_primes_which_are_sum_of_consequtive_primes
		primes = Fixnum.primes.to_a
		length = primes.length
		one_million = 10**6

		result = {}
		primes.each_with_index do |prime, first_prime_index|
			sum = prime
			already_added = [prime]

			(first_prime_index+1...length).each do |index|
				sum += primes[index]
				break if sum > one_million

				already_added << primes[index]

				if sum.prime?
					if result.has_key? sum
						result[sum] = already_added.dup if result[sum].length < already_added.length
					else
						result[sum] = already_added.dup
					end
				end				
			end
		end
		result
	end

	def test_prime_below_one_million_that_is_sum_of_consequtive_primes
		Fixnum.primes = eratosthenes 10**6

		result = all_primes_which_are_sum_of_consequtive_primes.max_by { |k,v| v.length }

		assert_equal 997651, result[0]
		
	end
end