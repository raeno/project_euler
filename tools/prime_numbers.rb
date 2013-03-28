# two implementations of sieve of eratosthenes
# prime_numbers - my own implementation using hash
# eratosthenes - rosetta_code implementation
#
# results for 10^6 limit:
# user     system      total        real
# prime_numbers  8.970000   0.020000   8.990000 (  9.004234)
# eratosthenes  1.150000   0.000000   1.150000 (  1.156921)

def prime_numbers(limit = 1000000)
  all_numbers = Hash[(2..limit).map { |v| [v, 0]}]

  border = Math.sqrt(limit).to_i

  next_prime = 1
  while next_prime < border
    next_prime = all_numbers.find { |_,v| v == 0}[0]

    all_numbers[next_prime] = -1

    all_numbers.each { |key, value|
      if value == 0
        all_numbers.delete key if key % next_prime == 0
      end
    }
  end
  all_numbers.keys
end

def eratosthenes(limit = 1000000)
  nums = [0, 0] + (2..limit).to_a
  (2..Math.sqrt(limit).to_i).each do |i|
    if nums[i].nonzero?
      (i**2..limit).step(i) {|m| nums[m] = 0}
    end
  end
  nums.find_all {|m| m.nonzero?}
end