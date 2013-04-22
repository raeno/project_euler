require_relative '../tools/prime_numbers'
require_relative '../tools/big_numbers'

class Fixnum
  DIGITS_IN_WORDS = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
                      5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine' }
  FIRST_DECADE_IN_WORDS = { 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 
                            15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}
  DECADES_IN_WORDS = { 20 => 'twenty', 30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty',
                       70 => 'seventy', 80 => 'eighty', 90 => 'ninety'} 
  TENS_POWERS_IN_WORDS = { 3 => 'thousand', 6 => 'million', 9 => 'billion'}

  class << self
    def primes
      @primes ||= eratosthenes(10**6)
    end
  end

  def palindrome?
    num_string = self.to_s
    left_border = num_string.length/2
    right_border = num_string.length.even? ? left_border : left_border + 1
    num_string[0..left_border-1] == num_string[right_border..num_string.length].reverse
  end

  def divisors_powers
    divisors = self.prime_divisors.reverse
    prime_powers = {}
    divisors.each do |divisor|
      value = self
      power = 0
      while value % divisor == 0
        power += 1
        value = value / divisor
      end
      prime_powers[divisor] = power
    end
    prime_powers
  end

  def divisors_count
    powers = self.divisors_powers
    powers.values.inject(1) { |mem, var| mem *= var +1 }
  end

  def proper_divisors_sum
    powers = self.divisors_powers
    sums = []
    powers.keys.each do |key|
       sums << (0..powers[key]).inject(0) { |mem, var| mem += key**var }
    end

    sums.inject(1) { |mem,var| mem *= var} - self
  end

  def prime_divisors
    divisors = []
    value = self

    Fixnum.primes.each do |prime|
      break if value < prime
      if value % prime == 0
        divisors << prime
        value = value / prime
        redo
      end
    end
    divisors
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
    when 100..999
      decades = self % 100
      hundreds = (self - decades)/100
      result = DIGITS_IN_WORDS[hundreds] + ' hundred'
      result += ' and ' + decades.in_words unless decades == 0
      return result
    when 1000
      'one thousand'
    else
      power_of_ten = Math.log10(self).floor
      nearest_power_of_ten_with_name = power_of_ten - power_of_ten%3
      power_name = TENS_POWERS_IN_WORDS[nearest_power_of_ten_with_name]
      power_count = self / 10**nearest_power_of_ten_with_name

      rest = self % 10**nearest_power_of_ten_with_name

      power_count.in_words + ' ' + power_name + ' ' + rest.in_words
    end
  end

  def sum_of_digits
    digits = self.to_s.chars.map(&:to_i)
    digits.inject { |sum, var| sum += var  }
  end

  def amicable?
    pds = self.proper_divisors_sum
    if pds != self
      pds.proper_divisors_sum == self
    else
      false
    end
  end

end