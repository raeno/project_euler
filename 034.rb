require "test/unit"
require_relative 'tools/numbers'

class Test_Problem34 < Test::Unit::TestCase

	def is_sum_of_digits_factorials_equals_to_number(value)
		value.to_s.chars.map { |digit| digit.to_i.factorial }.reduce(0) { |mem, var| mem += var } == value
	end

	def test_numbers_with_sum_of_digits_factorials_equals_to_number
		curious_numbers = (3..100000).select { |n| is_sum_of_digits_factorials_equals_to_number(n) }
		assert_equal 40730, curious_numbers.reduce(0) { |mem,var| mem += var }
	end
end