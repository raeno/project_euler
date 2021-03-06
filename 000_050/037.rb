# frozen_string_literal: true

require 'test/unit'
require_relative 'tools/numbers'

class Test_Problem37 < Test::Unit::TestCase
  def find_truncatable_primes
    primes = Integer.primes.to_a
    [2, 3, 5, 7].each { |v| primes.delete v }
    primes.select(&:truncatable_prime?)
  end

  def test_sum_of_eleven_truncatable_primes
    assert_equal 748_317, find_truncatable_primes.reduce(0) { |mem, var| mem + var }
  end
end
