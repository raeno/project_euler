# frozen_string_literal: true

require 'test/unit'

require_relative 'tools/numbers'

class TestProblem_52 < Test::Unit::TestCase
  def products_permutations?(value)
    same_digits(value, value * 2) && same_digits(value, value * 3) &&
      same_digits(value, value * 4) && same_digits(value, value * 5) &&
      same_digits(value, value * 6)
  end

  def same_digits(first, second)
    first.to_s.chars.sort == second.to_s.chars.sort
  end

  def test_smallest_int_with_produces_permutatations
    result = (10**5..10**6).select { |v| products_permutations? v }.first
    assert_equal 142_857, result
  end
end
