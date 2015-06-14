# Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

require "test/unit"

class TestProblem_13 < Test::Unit::TestCase

	def find_sum
		numbers = []
		File.open('data/problem_13_data.txt') do |file|
			file.each { |line| numbers << line.to_i }
		end
		numbers.inject(0) { |mem, var| mem += var  }
	end

	def test_sum_of_many_big_numbers
		sum = find_sum
		assert_equal(5537376230, sum.to_s[0,10].to_i)
	end
end



