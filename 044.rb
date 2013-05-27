require "test/unit"

require "set"

class Test_Problem44 < Test::Unit::TestCase

	def pentagonal_sequence(limit = 10**6)
		sequence = Set.new
		limit.times { |n| sequence << n*(3*n-1)/2 }
		sequence.delete 0
		sequence
	end

	def special_pentagonals
		special = []

		pent_sequence = pentagonal_sequence 2500

		pent_sequence.each do |first|
			pent_sequence.each do |second|
				next if first >= second
				if pent_sequence.include? first+second
					if pent_sequence.include? second - first
						special << second - first
					end
				end
			end
		end
		special
	end

	def test_minimal_difference_between_special_pentagonal_numbers
		assert_equal 5482660, special_pentagonals.min
	end
end