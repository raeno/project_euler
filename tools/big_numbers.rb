class Bignum
  def sum_of_digits
    digits = self.to_s.chars.map(&:to_i)
    digits.inject { |sum, var| sum += var  }
  end
end