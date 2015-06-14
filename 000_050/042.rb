require "test/unit"

require_relative "tools/numbers"
require_relative 'tools/words_letters'

class Test_Problem42 < Test::Unit::TestCase

	def get_triangle_numbers
		numbers = Set.new
		(1..10000).each { |n| numbers << n*(n+1)/2 }
		numbers
	end

	def triangle_numbers
		@triangles ||= get_triangle_numbers
	end

	def triangle?(number)
		triangle_numbers.include? number
	end
	
	def test_triangle_words
		words_scores = all_words_from_file('data/problem_42_words.txt').map { |word| word_score word }
		triangle_scores =  words_scores.select { |score| triangle?(score) }
		assert_equal 162, triangle_scores.count

	end
end