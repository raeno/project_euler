# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

require "test/unit"

require_relative 'tools/numbers'

class TestProblem_4 < Test::Unit::TestCase
	def test_largest_palindrome_from_product_of_3_digit_numbers
		largest_palindrome = palindromes_from_product_of_3_gigit_numbers.max
		assert_equal(906609, largest_palindrome)		
	end
end

def palindromes_from_product_of_3_gigit_numbers
	palindromes = []
	999.downto 800 do |first|
	  999.downto 800 do |second|
	    palindromes << first*second if (first*second).palindrome?
  		end
	end	
	palindromes
end