require "test/unit"

require 'set'

class Test_Problem39 < Test::Unit::TestCase

	def correct_triangle(a,b,c)
		(a + b > c) && (a +c > b) && (b + c > a)
	end

	def right_angle_triangle(a,b,c)
		return false if a == b || a == c || b == c
		(a*a + b*b == c*c) || (a*a + c*c == b*b)|| (b*b + c*c == a*a)
	end

	def get_triangles
		triangles = Hash.new { |h,k| h[k] = Set.new }

		(1..100).each do |perimeter|
			(1..998).each do |a|
				(1..999-a).each do |b|
					c = perimeter - a - b

					triangles[perimeter] << [a,b,c].sort if correct_triangle(a,b,c) && right_angle_triangle(a,b,c)
				end
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