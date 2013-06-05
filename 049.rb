require "test/unit"

require_relative 'tools/numbers'

class TestProblem_49 < Test::Unit::TestCase

	def four_digits_prime_permutations
		four_digit_primes = Fixnum.primes.select { |n| n > 1000 && n < 10000 }

		result = []

		four_digit_primes.each do |prime|
			prime_permutations = prime.digits_permutations.uniq.select {|n| n > 1000}.select(&:prime?)
			result << prime_permutations if prime_permutations.length > 2
		end
		result
	end

	def arithmetic_sequence?(array)
		array[2] + array[0] == 2 * array[1]
	end


	def test_primes_that_are_permutations_and_arithmetic_sequence
		Fixnum.primes = eratosthenes 10**4

		result_sequences = []
		four_digits_prime_permutations.each do |mut|
			sequences = mut.permutation(3).map { |m| m.sort! }.uniq.select { |s| arithmetic_sequence? s }
			result_sequences << sequences if sequences.any?
		end

		assert_equal 296962999629, result_sequences.uniq[1].join('').to_i

	end
end