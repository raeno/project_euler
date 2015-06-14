# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require 'date'
require 'test/unit'

class TestProblem_19 < Test::Unit::TestCase

  def count_sundays
    date = DateTime.new(1901,1,1)

    count = 0
    while date.year < 2001
      count += 1 if date.sunday?
      date = date.next_month
    end
    count
  end

	def test_sundays_that_was_first_of_the_month_count
    assert_equal 171, count_sundays
	end
end