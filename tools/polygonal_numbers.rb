require 'set'
module PolygonalNumbers
	def triangle_sequence(limit = 10**6)
		sequence = Set.new
		limit.times { |n| sequence << n*(n+1)/2 }
		sequence.delete 0
		sequence
	end


	def pentagonal_sequence(limit = 10**6)
		sequence = Set.new
		limit.times { |n| sequence << n*(3*n-1)/2 }
		sequence.delete 0
		sequence
	end

	def hexagonal_sequence(limit = 10**6)
		sequence = Set.new
		limit.times { |n| sequence << n*(2*n-1) }
		sequence.delete 0
		sequence
	end
end