class Collatzchain
	attr_reader :chain
	
	def initialize(number)
		current = number
		@chain = []
		until current == 1
			current = next_number(current)
			@chain << current	
		end
	end

	def length 
		@chain.length
	end

	def next_number(number)
		if number.even?
			number = number/2
		else
			number = 3*number + 1
		end
	end
end

def longest_collatzChain(max_start_num)
	chains_lengths = (1..max_start_num).map { |n| [n,Collatzchain.new(n).length] }
	chains_lengths = Hash[chains_lengths]
	chains_lengths.max_by { |k,v| v}

end

p longest_collatzChain(10**6)
