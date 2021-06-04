# frozen_string_literal: true

require 'test/unit'

require_relative 'tools/numbers'

class TestProblem_51 < Test::Unit::TestCase
  def all_number_families(number)
    string_num = number.to_s
    families = []
    (0..string_num.length - 2).each do |i|
      (i + 1..string_num.length - 2).each do |j|
        (j + 1..string_num.length - 2).each do |k|
          family = []
          (0..9).each do |digit|
            next if i.zero? && digit.zero?

            new_number = string_num.dup
            new_number[i] = digit.to_s
            new_number[j] = digit.to_s
            new_number[k] = digit.to_s
            family << new_number.to_i
          end
          families << family
        end
      end
    end
    families
  end

  def largest_prime_family(number)
    all_families = all_number_families number
    all_families.map  { |family| [family, family.count(&:prime?)] }.max_by { |i| i[1] } || [[], 0]
  end

  def find_8_size_prime_family
    suitable_primes = Integer.primes.select { |p| p.to_s =~ /(\d)\1{2}/ }

    suitable_primes.each do |prime_number|
      largest_family, size = largest_prime_family prime_number
      return largest_family if size == 8
    end
    nil
  end

  def test_8_size_prime_family_lookupze_prime_family
    family = find_8_size_prime_family

    min_prime = family.min
    assert_equal 121_313, min_prime
  end
end
