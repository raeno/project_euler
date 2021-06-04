# frozen_string_literal: true

require 'test/unit'
require_relative 'tools/polygonal_numbers'

class Test_Problem44 < Test::Unit::TestCase
  include PolygonalNumbers

  def special_pentagonals
    special = []

    pent_sequence = pentagonal_sequence 2500

    pent_sequence.each do |first|
      pent_sequence.each do |second|
        next if first >= second

        next unless pent_sequence.include? first + second

        special << second - first if pent_sequence.include? second - first
      end
    end
    special
  end

  def test_minimal_difference_between_special_pentagonal_numbers
    assert_equal 5_482_660, special_pentagonals.min
  end
end
