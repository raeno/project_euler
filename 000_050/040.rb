# frozen_string_literal: true

require 'test/unit'

class Test_Problem40 < Test::Unit::TestCase
  def concatendated_fraction
    fraction_string = ''
    (1..200_000).each do |n|
      fraction_string << n.to_s
    end
    fraction_string
  end

  def test_champernowne_constant
    fraction_string = concatendated_fraction
    digits = []
    [1, 10, 100, 1000, 10**4, 10**5, 10**6].each do |n|
      digits << fraction_string[n - 1].to_i
    end
    assert_equal 210, digits.reduce(1) { |mem, var| mem * var }
  end
end
