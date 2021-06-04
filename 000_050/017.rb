# frozen_string_literal: true

# If the numbers 1 to 5 are written out in words: one, two, three, four, five; there are 3 + 3
# + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how
# many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23
# letters and 115 (one hundred and fifteen) contains 20 letters.

require 'test/unit'
require_relative 'tools/numbers'

class TestProblem_17 < Test::Unit::TestCase
  def test_letters_count_in_a_1_to_1000_range_written_in_words
    letters_count = (1..1000).map { |number| number.in_words.delete(' -').length }
                             .inject(0) { |mem, var| mem + var }
    assert_equal 21_124, letters_count
  end
end
