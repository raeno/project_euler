require "test/unit"

require_relative "tools/numbers"

class TestProblem_47 < Test::Unit::TestCase

	def has_four_distinct_prime_factors?(values)
		values.each do |value|
			return false if value.divisors_powers.length != 4
		end
		return true
	end

	def test_four_consequtive_integers_to_have_distinct_prime_factors
		consequtives = []
		(10**5..10**6).each do |v|
			consequtives = [v, v+1, v+2, v+3]
			break if has_four_distinct_prime_factors? consequtives
		end
		assert_equal 134043, consequtives[0]
	end
end