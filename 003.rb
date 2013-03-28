#  Problem #3
#
#  The prime factors of 13195 are 5, 7, 13 and 29.
#  What is the largest prime factor of the number 600851475143 ?

require_relative 'tools/prime_numbers'

def largest_prime_factor(num)
  border = Math.sqrt(num).to_i
  prime_numbers = eratosthenes(border + 1).reverse

  prime_numbers.each do |x|
    return x if num % x == 0
  end
end

p largest_prime_factor 600851475143