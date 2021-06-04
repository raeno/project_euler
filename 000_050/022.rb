# frozen_string_literal: true

# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand
# first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53,
# is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.

# What is the total of all the name scores in the file?

require 'test/unit'
require_relative 'tools/words_letters'

class TestProblem_22 < Test::Unit::TestCase
  def total_score
    all_words = all_words_from_file('data/problem_22_names.txt')

    scores =  all_words.map { |str| word_score str }
    final_scores = scores.each_with_index.map { |v, i| v * (i + 1) }

    final_scores.reduce(&:+)
  end

  def test_sum_of_all_name_scores
    assert_equal 871_198_282, total_score
  end
end
