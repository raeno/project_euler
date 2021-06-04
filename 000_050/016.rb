# frozen_string_literal: true

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

require 'test/unit'
require_relative 'tools/numbers'

class TestProblem_16 < Test::Unit::TestCase
  def test_sum_of_digits_of_2_in_1000_power
    number = 2**1000
    assert_equal 1366, number.sum_of_digits
  end
end
