class Bignum
  def sum_of_digits
    digits = self.to_s.chars.map(&:to_i)
    digits.inject { |sum, var| sum += var  }
  end

  def palindrome?
    num_string = self.to_s
    left_border = num_string.length/2
    right_border = num_string.length.even? ? left_border : left_border + 1
    num_string[0..left_border-1] == num_string[right_border..num_string.length].reverse
  end
end