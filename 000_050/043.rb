require "test/unit"

require_relative 'tools/numbers'

class Test_Problem43 < Test::Unit::TestCase
  	def all_pandigitals_with_0
  		@pandigitals ||= 1234567890.digits_permutations
  	end

  	def substring_divisible?(number)
  		number_string = number.to_s
  		return false unless number_string[1..3].to_i.even?
  		return false unless number_string[2..4].to_i % 3 == 0
  		return false unless number_string[3..5].to_i % 5 == 0
  		return false unless number_string[4..6].to_i % 7 == 0
  		return false unless number_string[5..7].to_i % 11 == 0
  		return false unless number_string[6..8].to_i % 13 == 0
  		return false unless number_string[7..9].to_i % 17 == 0
  		true
  	end

	def test_pandigital_numbers_with_substring_divisibility
		numbers = all_pandigitals_with_0.select { |n| substring_divisible? n }
		assert_equal 16695334890, numbers.reduce(0) { |mem,var| mem += var }
	end	
end