require "test/unit"

class TestProblem_48 < Test::Unit::TestCase

	def test_ten_digits_of_powers_sum
		value = (1..1000).map { |v| v**v }.reduce(&:+)
		assert_equal 9110846700, value.to_s.reverse[0..9].reverse.to_i
	end
end