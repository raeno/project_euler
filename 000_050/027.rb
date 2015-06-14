# Euler published the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
# However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly 
# when n = 41, 41² + 41 + 41 is clearly divisible by 41.

# Using computers, the incredible formula  n² + 79n + 1601 was discovered, which produces 80 primes
# for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

# Considering quadratics of the form:

# n² + an + b, where |a|  1000 and |b|  1000

# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |-4| = 4

# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes
# for consecutive values of n, starting with n = 0.

require 'test/unit'
require_relative 'tools/numbers'

class TestProblem_27 < Test::Unit::TestCase
	def quadratic_sequence(a,b)
		primes = []
		n = 0
		while true
			next_value = n*n + a*n + b
      if next_value.prime?
        primes << next_value
        n += 1
      else
        break
      end
		end
		primes
  end

  def all_sequences
    sequences = {}
    (-999..999).each do |a|
      (-999..999).each do |b|
        sequences[[a,b]] = quadratic_sequence(a,b).length
      end
    end
    sequences
  end

	def test_quadratic_expression_that_produces_max_number_of_primes
    factors, length =  all_sequences.max_by { |_,v| v}

    assert_equal 71, length
    assert_equal -59231,factors.reduce(&:*)
	end
end