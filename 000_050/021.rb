# frozen_string_literal: true

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair
# and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require 'test/unit'
require_relative 'tools/numbers'

class TestProblem_21 < Test::Unit::TestCase
  def test_sum_of_all_amicable_numbers_under_10000
    all_amicable = (3..10_000).select(&:amicable?)
    assert_equal 31_626, all_amicable.inject(0) { |mem, var| mem + var }
  end
end
