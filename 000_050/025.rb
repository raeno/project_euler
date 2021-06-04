# frozen_string_literal: true

# What is the first term in the Fibonacci sequence to contain 1000 digits?

require 'test/unit'

class TestProblem_25 < Test::Unit::TestCase
  def fibonacci(count)
    numbers = [1, 1]
    (2..count - 1).each do |index|
      numbers << numbers[index - 2] + numbers[index - 1]
    end
    numbers
  end

  def test_first_fibonacci_that_contain_1000_digits
    sequence = fibonacci 10**4
    result = sequence.find { |v| v.to_s.length >= 1000 }

    assert_equal 4782, sequence.index(result) + 1
  end
end
