# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require_relative 'tools/prime_numbers'

p eratosthenes(2*(10**6)).reduce(&:+)