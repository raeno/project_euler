require "test/unit"

require 'set'
require_relative 'tools/numbers'

class Test_Problem38 < Test::Unit::TestCase

	def get_multiply_numbers
		numbers = Set.new

		(1..10000).each do |num|
			product = ''
			(1..10).each do |n|
				product += (num*n).to_s
				break if product.length >= 9
			end
			if product.length == 9 && product.to_i.pandigital?
				numbers << product.to_i
			end
		end
		numbers
	end

	def test_maximum_pandigital_number_produced_as_multiply
		numbers = get_multiply_numbers
		assert_equal 932718654, numbers.max
	end
end