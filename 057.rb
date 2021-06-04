# frozen_string_literal: true

require 'test/unit'

class Test_Problem57 < Test::Unit::TestCase
  def fractions_sequence(limit)
    items = [[3, 2]]
    (2..limit).each do |index|
      numerator, denominator = items[index - 2]
      items << [numerator + denominator * 2, numerator + denominator]
    end
    items
  end

  def test_numerator_count
    fractions_count = fractions_sequence(1000).select { |item| item[0].to_s.length > item[1].to_s.length }.count
    assert_equal 153, fractions_count
  end
end
