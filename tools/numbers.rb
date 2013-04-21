require_relative '../tools/prime_numbers'
class Fixnum
  def palindrome?
    num_string = self.to_s
    left_border = num_string.length/2
    right_border = num_string.length.even? ? left_border : left_border + 1
    num_string[0..left_border-1] == num_string[right_border..num_string.length].reverse
  end

  def divisors_powers(prime_numbers = nil)
    divisors = self.prime_divisors(prime_numbers).reverse
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

  def divisors_count(prime_numbers)
    powers = self.divisors_powers prime_numbers
    result = powers.values.inject(1) { |mem, var| mem *= var +1 }
    p result
    result
  end

  def prime_divisors(prime_numbers = nil)
    prime_numbers ||= eratosthenes 10**7
    prime_numbers.select {|prime| self % prime == 0}
  end
end