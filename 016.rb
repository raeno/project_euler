a = 2**1000

def sum_of_digits(number)
	digits = number.to_s.chars.map(&:to_i)
	digits.inject { |sum, var| sum += var  }
end

p sum_of_digits a
