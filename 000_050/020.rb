# frozen_string_literal: true

# Find the sum of the digits in the number 100!

require 'test/unit'
require_relative 'tools/numbers'

class TestProblem_20 < Test::Unit::TestCase
  def test_sum_of_digits_of_100!
    assert_equal 648, 100.factorial.sum_of_digits
  end
end
