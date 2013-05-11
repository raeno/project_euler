class Fraction
	attr_accessor :numerator, :denominator

	def initialize(num, denom)
		self.numerator = num
		self.denominator = denom
	end

	def value
		numerator/denominator.to_f
	end

	def to_s
		"#{numerator}/#{denominator}"
	end

	def has_same_digit_both_sides
		(numerator.to_s.chars & denominator.to_s.chars).any?
	end
end
