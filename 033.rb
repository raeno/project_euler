require "test/unit"

require_relative 'tools/fraction.rb'

class Test_Problem33 < Test::Unit::TestCase

	def fractions_with_at_least_one_same_digit
		fractions = []
		(10..99).each do |num|
			(10..99).each do |denom|
				fraction = Fraction.new num, denom
				fractions << fraction if fraction.has_same_digit_both_sides
			end
		end
		fractions
	end

	def test_curious_fractions
		p fractions_with_at_least_one_same_digit.count
	end
end