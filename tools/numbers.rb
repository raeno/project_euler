class Fixnum
  DIGITS_IN_WORDS = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
                      5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine' }

  def palindrome?
    num_string = self.to_s
    left_border = num_string.length/2
    right_border = num_string.length.even? ? left_border : left_border + 1
    num_string[0..left_border-1] == num_string[right_border..num_string.length].reverse
  end

  def factorial
 	(2..self).inject(1) { |mem, var| mem *= var  }
  end

  def in_words
  	if self >= 0 && self < 10
  		return DIGITS_IN_WORDS[self]
    end

  end

  
end


p 9.in_words  