# frozen_string_literal: true

# two implementations of sieve of eratosthenes
# prime_numbers - my own implementation using hash
# eratosthenes - rosetta_code implementation
#
# results for 10^6 limit:
# user     system      total        real
# prime_numbers  8.970000   0.020000   8.990000 (  9.004234)
# eratosthenes  1.150000   0.000000   1.150000 (  1.156921)

def prime_numbers(limit = 1_000_000)
  all_numbers = Hash[(2..limit).map { |v| [v, 0] }]

  border = Math.sqrt(limit).to_i

  next_prime = 1
  while next_prime < border
    next_prime = all_numbers.find { |_, v| v.zero? }[0]

    all_numbers[next_prime] = -1

    all_numbers.each do |key, value|
      all_numbers.delete key if value.zero? && (key % next_prime).zero?
    end
  end
  all_numbers.keys
end

def eratosthenes(limit = 1_000_000)
  nums = [0, 0] + (2..limit).to_a
  (2..Math.sqrt(limit).to_i).each do |i|
    (i**2..limit).step(i) { |m| nums[m] = 0 } if nums[i].nonzero?
  end
  nums.find_all(&:nonzero?)
end

def primes_without_even_digits
  even_chars = [0, 2, 4, 6, 8].map(&:to_s)
  Integer.primes.reject { |p| (p.to_s.chars.to_a & even_chars).any? }
end
