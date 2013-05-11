require "test/unit"
require 'set'

class Test_Problem29 < Test::Unit::TestCase
	def powers_combinations(a_limit, b_limit)
		powers = Set.new	
		(2..a_limit).each do |a|
			(2..b_limit).each do |b|
				powers << a ** b
				powers << b ** a
			end
		end
		powers
	end

	def test_different_powers_combinations_of_5
		assert_equal 15, powers_combinations(5,5).count
	end

	def test_different_powers_combinations_of_100
		assert_equal 9183, powers_combinations(100,100).count
	end
end