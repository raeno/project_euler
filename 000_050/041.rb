# frozen_string_literal: true

require 'test/unit'

require_relative 'tools/numbers'

class Test_Problem41 < Test::Unit::TestCase
  def test_largest_pandigital_prime
    primes = eratosthenes 10**7
    pandigit_primes = primes.select(&:pandigital?)
    assert_equal 7_652_413, pandigit_primes.max
  end
end
