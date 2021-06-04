# frozen_string_literal: true

require 'test/unit'
require 'benchmark'

class TestProblem_14 < Test::Unit::TestCase
  def chain_length(number)
    length = 0
    current = number

    until current == 1
      if @lengths[current]
        length += @lengths[current]
        break
      end
      current = current.even? ? current / 2 : 3 * current + 1
      length += 1
    end
    @lengths[number] = length
  end

  def find_longest_length(limit)
    @lengths = {}
    (2..limit).each do |start_number|
      chain_length(start_number)
    end
    @lengths.max_by { |_k, v| v }
  end

  def test_longest_collatz_chain
    assert_equal [837_799, 524], find_longest_length(10**6)
  end
end
