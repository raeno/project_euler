# frozen_string_literal: true

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

require 'test/unit'
require_relative 'tools/prime_numbers'

class TestProblem_7 < Test::Unit::TestCase
  def test_10001st_prime_number
    assert_equal(104_743, eratosthenes(10**6)[10_000])
  end
end
