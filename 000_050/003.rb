# frozen_string_literal: true

#  Problem #3
#
#  The prime factors of 13195 are 5, 7, 13 and 29.
#  What is the largest prime factor of the number 600851475143 ?

require 'test/unit'
require_relative 'tools/prime_numbers'

def largest_prime_factor(num)
  border = Math.sqrt(num).to_i
  prime_numbers = eratosthenes(border + 1).reverse

  prime_numbers.each do |x|
    return x if (num % x).zero?
  end
end

class TestProblem_3 < Test::Unit::TestCase
  def test_largest_prime_factor_of_600851475143
    assert_equal(6857, largest_prime_factor(600_851_475_143))
  end
end
