require 'test/unit'


class CollatzChain
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
			number/2
		else
			3*number + 1
		end
	end

	class << self
		def longest_chain(max_start_num)
			chains_lengths = (1..max_start_num).map { |n| [n,CollatzChain.new(n).length] }
			chains_lengths = Hash[chains_lengths]
			chains_lengths.max_by { |_,v| v}
		end
	end
end


class TestProblem_14 < Test::Unit::TestCase
	def test_longest_collatz_chain
		assert_equal [837799,524], CollatzChain.longest_chain(10**6)
	end
end