class Fixnum
  DIGITS_IN_WORDS = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
                      5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine' }
  FIRST_DECADE_IN_WORDS = { 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 
                            15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}
  DECADES_IN_WORDS = { 20 => 'twenty', 30 => 'thirty', 40 => 'fourty', 50 => 'fifty', 60 => 'sixty',
                       70 => 'seventy', 80 => 'eighty', 90 => 'ninety'} 

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
  	case self
    when 0..9
      DIGITS_IN_WORDS[self]
    when 10..19
      FIRST_DECADE_IN_WORDS[self]
    when 20..99
      if self % 10 == 0
        DECADES_IN_WORDS[self]
      else
        last_digit = self % 10
        decade = self - last_digit
        DECADES_IN_WORDS[decade] + '-' + DIGITS_IN_WORDS[last_digit]
      end
    end
  end

  
end


p 79.in_words  