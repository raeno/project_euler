# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#    a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require "test/unit"


class TestProblem_9 < Test::Unit::TestCase

	def find_pythagorean_triplet_with_sum_equal_one_thousand
		1.upto 998 do |a|
		  1.upto 999-a do |b|
		    c = 1000 -a - b
		    return [a,b,c] if a**2 + b**2 == c**2
		  end
		end
	end

	def test_product_of_pythagorean_triplet_for_which_sum_equals_one_thousand
		triplet = find_pythagorean_triplet_with_sum_equal_one_thousand
		product = triplet.inject(1) { |mem, var| mem *= var }
		assert_equal(31875000, product)
	end
end


