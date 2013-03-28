# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#    a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

1.upto 998 do |a|
  1.upto 999-a do |b|
    c = 1000 -a - b
    p a*b*c if a**2 + b**2 == c**2
  end
end
