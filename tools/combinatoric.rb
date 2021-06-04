# frozen_string_literal: true

def selections(base, value)
  base.factorial / (value.factorial * (base - value).factorial)
end
