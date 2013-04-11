require_relative 'tools/numbers.rb'

p 100.factorial.to_s.chars.inject(0) { |mem, var| mem += var.to_i  }