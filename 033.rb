require "test/unit"

require_relative 'tools/fraction.rb'

class Test_Problem33 < Test::Unit::TestCase

	def fractions_with_at_least_one_same_digit
		fractions = []
		(10..99).each do |num|
			(10..99).each do |denom|
				fraction = Fraction.new num, denom
				fractions << fraction if fraction.has_same_digit_both_sides? && fraction.correct? && !fraction.trivial?
			end
		end
		fractions
	end

	def test_curious_fractions
		fractions = fractions_with_at_least_one_same_digit
		fractions = fractions.select { |f| f.curious? }

		product_of_curious_fractions = fractions.reduce(Fraction.new(1,1)) { |mem, var| mem *= var}.to_s
		
		assert_equal '1/100', product_of_curious_fractions 
	end
end