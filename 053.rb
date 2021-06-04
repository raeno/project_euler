# frozen_string_literal: true

require 'test/unit'

require_relative 'tools/numbers'
require_relative 'tools/combinatoric'

class TestProblem_53 < Test::Unit::TestCase
  def all_selections(limit)
    all = []
    one_million = 10**6
    (2..limit).each do |base|
      (1..base).each do |value|
        selection = selections base, value
        all << selection if selection > one_million
      end
    end
    all
  end

  def test_selection_greater_one_million
    assert_equal 4075, all_selections(100).count
  end
end
