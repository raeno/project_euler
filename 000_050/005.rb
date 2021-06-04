# frozen_string_literal: true

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'test/unit'

class TestProblem_5 < Test::Unit::TestCase
  def test_smallest_positive_number_that_evenly_divisible_by_all_from_1_to_20
    number = (1..20).reduce { |result, i| result.lcm i }
    assert_equal(232_792_560, number)
  end
end
