# If the numbers 1 to 5 are written out in words: one, two, three, four, five; there are 3 + 3
# + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how
# many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23
# letters and 115 (one hundred and fifteen) contains 20 letters.

require_relative 'tools/numbers'

result = (1..1000).map { |number| number.in_words.delete(' -').length}.inject(0) { |mem, var| mem += var  }

p result