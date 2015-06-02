require 'test/unit'

require_relative 'tools/numbers'

class Test_Problem55 < Test::Unit::TestCase

	def lynchrel?(number)
		(1..50).each do |iteration|
			number += number.to_s.reverse.to_i
			return false if number.palindrome?
		end
		true
	end

	def test_lynchrell_number_detection
		assert lynchrel?(4994)
		assert lynchrel?(10677)
		refute lynchrel?(57)
		refute lynchrel?(10000)
	end

	def test_lynchrell_number_count
		lynchrel_numbers_count = (1..10000).select { |number| lynchrel?(number) }.count
		assert_equal 249, lynchrel_numbers_count
	end


end