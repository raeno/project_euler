# frozen_string_literal: true

# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require 'test/unit'

require_relative 'tools/numbers'

class TestProblem_36 < Test::Unit::TestCase
  def palindrome_in_both_bases?(number)
    number.palindrome? && number.base2_palindrome?
  end

  def test_sum_of_palindromic_numbers_in_base10_and_base2
    palindroms = (1..1_000_000).select { |n| palindrome_in_both_bases?(n) }
    assert_equal 872_187, palindroms.reduce(0) { |mem, var| mem + var }
  end
end
