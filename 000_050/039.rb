require "test/unit"
require 'set'

class Test_Problem39 < Test::Unit::TestCase

	# sqrt(a^2+b^2) is an integer for right triangle
	def sum_square(a,b)
		x = Math.sqrt(a*a + b*b)
		(x - x.to_i).abs < 0.001 ? x.to_i : false
	end

	def get_triangles
		triangles = Hash.new { |h,k| h[k] = Set.new }

		(1..998).each do |a|
			(a..999-a).each do |b|
				c = sum_square(a,b)
				triangles[a+b+c] << [a,b,c].sort if c && a+b+c <= 1000
			end
		end	
		triangles
	end

	def test_right_triangle_perimiter_with_maximum_possible_triangles
		triangles = get_triangles
		result = triangles.sort_by {|k,v| v.length }.last
		assert_equal 840, result[0]
		assert_equal 8, result[1].length
	end
end