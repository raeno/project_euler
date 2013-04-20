require 'date'
date = DateTime.new(1901,1,1)

count = 0
while date.year < 2001
	count += 1 if date.monday?
	date = date.next_month
end

p count

