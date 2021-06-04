# frozen_string_literal: true

# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28,
# which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and
# it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that
# can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be
# shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis even though it is known that
# the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'test/unit'
require_relative 'tools/numbers'

class TestProblem_23 < Test::Unit::TestCase
  def cartesian(xs, ys)
    results = []
    xs.each do |x|
      ys.each do |y|
        sum = x + y
        results << sum if sum < 28_124
      end
    end
    results.uniq!.sort
  end

  def test_sum_of_all_positive_integers_which_cannot_be_sum_of_two_abundant_numbers
    all_abundants = (1..28_124).select(&:abundant?)
    abundants_cartesian = cartesian all_abundants, all_abundants
    not_representable_as_sum = (1..28_123).to_a - abundants_cartesian
    assert_equal 4_179_871, not_representable_as_sum.reduce(&:+)
  end
end
