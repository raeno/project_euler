require "test/unit"

require 'set'

class Test_Problem38 < Test::Unit::TestCase

	def pandigital?(string)
		@digits ||= (1..9).to_a
		string.chars.map(&:to_i).sort == @digits
	end

	def get_multiply_numbers
		numbers = Set.new

		(1..10000).each do |num|
			product = ''
			(1..10).each do |n|
				product += (num*n).to_s
				break if product.length >= 9
			end
			if product.length == 9 && pandigital?(product)
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