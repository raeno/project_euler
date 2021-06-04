# frozen_string_literal: true

require 'set'
require 'benchmark'

require_relative '../tools/prime_numbers'

# rubocop:disable Metrics/ClassLength
class Integer
  DIGITS_IN_WORDS = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
                      5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine' }.freeze
  FIRST_DECADE_IN_WORDS = { 10 => 'ten', 11 => 'eleven',
                            12 => 'twelve', 13 => 'thirteen',
                            14 => 'fourteen', 15 => 'fifteen',
                            16 => 'sixteen', 17 => 'seventeen',
                            18 => 'eighteen', 19 => 'nineteen' }.freeze
  DECADES_IN_WORDS = { 20 => 'twenty', 30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty',
                       70 => 'seventy', 80 => 'eighty', 90 => 'ninety' }.freeze
  TENS_POWERS_IN_WORDS = { 3 => 'thousand', 6 => 'million', 9 => 'billion' }.freeze

  class << self
    def primes
      @primes ||= if File.file?('data/primes')
                    Marshal.load(File.read('data/primes'))
                  else
                    prime_numbers = eratosthenes(4 * 10**8).to_set
                    File.open('data/primes', 'w') { |f| f.write(Marshal.dump(prime_numbers)) }
                    prime_numbers
                  end
    end

    def primes=(primes)
      @primes = primes.to_set
    end

    def factorials
      @factorials ||= 100.all_factorials
    end
  end

  def prime?
    Integer.primes.include? self
  end

  def circular_prime?
    rotations = digits_rotations
    rotations.each do |rotation|
      return false unless rotation.prime?
    end
    true
  end

  def truncatable_prime?
    return false unless prime?

    self_string = to_s
    length = self_string.length

    length.downto 2 do |index|
      left = self_string[length - index + 1..length].to_i
      right = self_string[0..index - 2].to_i
      return false unless left.prime? && right.prime?
    end
    true
  end

  def digits_rotations
    rotations = []
    digits = to_s.chars.to_a
    digits.length.times do
      rotations << digits.rotate!.join('').to_i
    end
    rotations
  end

  def digits_permutations
    digits = to_s.chars.to_a
    digits.permutation(digits.length).to_a.map { |mutation| mutation.join('').to_i }
  end

  def palindrome?
    num_string = to_s
    return true if num_string.length == 1

    left_border = num_string.length / 2
    right_border = num_string.length.even? ? left_border : left_border + 1
    num_string[0..left_border - 1] == num_string[right_border..num_string.length].reverse
  end

  def base2_palindrome?
    binary = to_s(2).to_i
    binary.palindrome?
  end

  def divisors_powers
    divisors = prime_divisors.reverse
    prime_powers = {}
    divisors.each do |divisor|
      value = self
      power = 0
      while (value % divisor).zero?
        power += 1
        value /= divisor
      end
      prime_powers[divisor] = power
    end
    prime_powers
  end

  def common_divisors(other)
    common_divisors = []
    self_divisors_powers = divisors_powers
    other_divisors_powers = other.divisors_powers

    self_divisors_powers.each_key do |divisor|
      next unless other_divisors_powers.include?(divisor)

      common_divisor_power =
        if self_divisors_powers[divisor] <= other_divisors_powers[divisor]
          self_divisors_powers[divisor]
        else
          other_divisors_powers[divisor]
        end
      common_divisor_power.times { |_| common_divisors << divisor }
    end
    common_divisors
  end

  def greatest_common_divisor(second_number)
    common_divisors(second_number).reduce(1) { |mem, var| mem * var }
  end

  def divisors_count
    powers = divisors_powers
    powers.values.reduce(1) { |mem, var| mem * var + 1 }
  end

  def proper_divisors_sum
    powers = divisors_powers
    sums = []
    powers.each_key do |key|
      sums << (0..powers[key]).reduce(0) { |mem, var| mem + key**var }
    end

    sums.reduce(1) { |mem, var| mem * var } - self
  end

  def prime_divisors
    divisors = []
    value = self

    Integer.primes.each do |prime|
      break if value < prime

      next unless (value % prime).zero?

      divisors << prime
      value /= prime
      redo
    end
    divisors
  end

  def factorial
    return Integer.factorials[self] if Integer.factorials.key?(self)

    (2..self).inject(1) { |mem, var| mem * var }
  end

  def all_factorials
    factorial_keeper = 1
    factorials = {}
    (1..self).each do |n|
      factorial_keeper *= n
      factorials[n] = factorial_keeper
    end
    factorials
  end

  # rubocop:disable Metrics/MethodLength
  def in_words
    case self
    when 0..9
      DIGITS_IN_WORDS[self]
    when 10..19
      FIRST_DECADE_IN_WORDS[self]
    when 20..99
      if (self % 10).zero?
        DECADES_IN_WORDS[self]
      else
        last_digit = self % 10
        decade = self - last_digit
        "#{DECADES_IN_WORDS[decade]}-#{DIGITS_IN_WORDS[last_digit]}"
      end
    when 100..999
      decades = self % 100
      hundreds = (self - decades) / 100
      result = "#{DIGITS_IN_WORDS[hundreds]} hundred"
      result += " and #{decades.in_words}" unless decades.zero?
      result
    when 1000
      'one thousand'
    else
      power_of_ten = Math.log10(self).floor
      nearest_power_of_ten_with_name = power_of_ten - power_of_ten % 3
      power_name = TENS_POWERS_IN_WORDS[nearest_power_of_ten_with_name]
      power_count = self / 10**nearest_power_of_ten_with_name

      rest = self % 10**nearest_power_of_ten_with_name

      "#{power_count.in_words} #{power_name} #{rest.in_words}"
    end
  end

  # rubocop:enable Metrics/MethodLength
  def sum_of_digits
    digits = to_s.chars.map(&:to_i)
    digits.inject { |sum, var| sum + var }
  end

  def amicable?
    pds = proper_divisors_sum
    if pds != self
      pds.proper_divisors_sum == self
    else
      false
    end
  end

  def perfect?
    proper_divisors_sum == self
  end

  def deficient?
    proper_divisors_sum < self
  end

  def abundant?
    proper_divisors_sum > self
  end

  def pandigital?
    string_rep = to_s
    return false if string_rep.length > 9

    digits = (1..string_rep.length).to_a
    string_rep.chars.map(&:to_i).sort == digits
  end
end
# rubocop:enable Metrics/ClassLength
