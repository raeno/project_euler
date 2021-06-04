# frozen_string_literal: true

require_relative '../tools/numbers'

class Fraction
  attr_accessor :numerator, :denominator

  def initialize(num, denom)
    self.numerator = num
    self.denominator = denom
  end

  def value
    numerator / denominator.to_f
  end

  def to_s
    "#{numerator}/#{denominator}"
  end

  def *(other)
    if other.instance_of?(Fraction)
      other = Fraction.new numerator * other.numerator, denominator * other.denominator
      other.simplify
    else
      self.numerator *= other
      simplify
    end
  end

  def same_digit_both_sides?
    (numerator.to_s.chars & denominator.to_s.chars).any?
  end

  def trivial?
    (numerator % 10).zero? && (denominator % 10).zero?
  end

  def correct?
    value < 1.0
  end

  def curious?
    return false unless same_digit_both_sides?
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
    Fraction.new numerator / gtd, denominator / gtd
  end

  def simplify!
    gtd = numerator.greatest_common_divisor denominator
    self.numerator /= gtd
    self.denominator /= gtd
  end
end
