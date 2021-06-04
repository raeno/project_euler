# frozen_string_literal: true

require 'test/unit'
require_relative 'tools/numbers'

class Test_Problem34 < Test::Unit::TestCase
  def sum_of_digits_factorials_equals_to_number?(value)
    value.to_s.chars.map { |digit| digit.to_i.factorial }.reduce(0) { |mem, var| mem + var } == value
  end

  def test_numbers_with_sum_of_digits_factorials_equals_to_number
    curious_numbers = (3..100_000).select { |n| sum_of_digits_factorials_equals_to_number?(n) }
    assert_equal 40_730, curious_numbers.reduce(0) { |mem, var| mem + var }
  end
end
