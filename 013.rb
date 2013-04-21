numbers = []
File.open('data/problem_13_data.txt') do |file|
	file.each { |line| numbers << line.to_i }
end

big_sum = numbers.inject(0) { |mem, var| mem += var  }

p big_sum.to_s[0,10]