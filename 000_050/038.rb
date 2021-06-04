# frozen_string_literal: true

require 'test/unit'

require 'set'
require_relative 'tools/numbers'
class Test_Problem38 < Test::Unit::TestCase
  def multiply_numbers
    numbers = Set.new

    (1..10_000).each do |num|
      product = ''
      (1..10).each do |n|
        product += (num * n).to_s
        break if product.length >= 9
      end
      numbers << product.to_i if product.length == 9 && product.to_i.pandigital?
    end
    numbers
  end

  def test_maximum_pandigital_number_produced_as_multiply
    assert_equal 932_718_654, multiply_numbers.max
  end
end
