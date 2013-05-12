require_relative '../tools/numbers'

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

	def *(multiplier)
		if multiplier.class == Fraction
			multiplier = Fraction.new numerator*multiplier.numerator, denominator*multiplier.denominator
			return multiplier.simplify
		else
			self.numerator *= multiplier
			return self.simplify
		end
	end

	def has_same_digit_both_sides?
		(numerator.to_s.chars & denominator.to_s.chars).any?
	end

	def trivial?
		numerator % 10 == 0 && denominator % 10 == 0
	end

	def correct?
		value < 1.0
	end

	def curious?
		return false unless has_same_digit_both_sides?
		return false if value == 1
			
		intersection = (numerator.to_s.chars & denominator.to_s.chars)
		curious = false

		intersection.each do |digit|
			new_num = numerator.to_s.delete(digit).to_i
			new_denom = denominator.to_s.delete(digit).to_i
			new_fraction = Fraction.new new_num, new_denom
			curious ||= new_fraction.value == value
		end
		curious
	end

	def simplify
		gtd = numerator.greatest_common_divisor denominator
		Fraction.new numerator/gtd, denominator/gtd
	end

	def simplify!
		gtd = numerator.greatest_common_divisor denominator
		self.numerator /= gtd
		self.denominator /= gtd
	end
end
