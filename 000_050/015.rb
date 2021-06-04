# frozen_string_literal: true

# Different pathes for grid can be represented as combination of 0 and 1 in 4 digits number.
# 0 - move one cell right, 1 - move one cell down.
# For example for grid 2x2 there are 6 routes: 0011, 1100, 0110, 0101. 1001, 1010
# Total count of all different routes is equal to number of combination from 4 by 2 ( C_4_2) = 4!/(2!*2!)

# for 20x20 grid total different routes count would be C_40_20

require_relative 'tools/numbers'

require 'test/unit'

class TestProblem_15 < Test::Unit::TestCase
  def test_total_different_routes_for_20x20_grid
    twenty_factorial = 20.factorial
    assert_equal 137_846_528_820, 40.factorial / (twenty_factorial * twenty_factorial)
  end
end
