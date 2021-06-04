# frozen_string_literal: true

require 'test/unit'

require_relative 'tools/numbers'

class TestProblem_46 < Test::Unit::TestCase
  def goldbach_numbers
    goldbach = Set.new

    primes = Integer.primes
    (1..50).each do |y|
      primes.each do |p|
        goldbach << p + 2 * y * y
      end
    end
    goldbach
  end

  def test_first_non_goldbach_number
    # we doesn't need to find primes up to one million for this task, ten thousands is enough
    Integer.primes = eratosthenes(10**4)

    odd_numbers = (1..5000).map { |x| 2 * x + 1 } - Integer.primes.to_a

    first_not_goldbach = (odd_numbers - goldbach_numbers.to_a).first

    assert_equal 5777, first_not_goldbach
  end
end
