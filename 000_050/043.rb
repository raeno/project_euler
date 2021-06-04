# frozen_string_literal: true

require 'test/unit'

require_relative 'tools/numbers'

class Test_Problem43 < Test::Unit::TestCase
  def all_pandigitals_with_zero
    @all_pandigitals_with_zero ||= 1_234_567_890.digits_permutations
  end

  def substring_divisible?(number)
    number_string = number.to_s
    return false unless number_string[1..3].to_i.even?
    return false unless (number_string[2..4].to_i % 3).zero?
    return false unless (number_string[3..5].to_i % 5).zero?
    return false unless (number_string[4..6].to_i % 7).zero?
    return false unless (number_string[5..7].to_i % 11).zero?
    return false unless (number_string[6..8].to_i % 13).zero?
    return false unless (number_string[7..9].to_i % 17).zero?

    true
  end

  def test_pandigital_numbers_with_substring_divisibility
    numbers = all_pandigitals_with_zero.select { |n| substring_divisible?(n) }
    assert_equal 16_695_334_890, numbers.reduce(0) { |mem, var| mem + var }
  end
end
