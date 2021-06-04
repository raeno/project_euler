# frozen_string_literal: true

require 'test/unit'
require_relative 'tools/polygonal_numbers'

class Test_Problem45 < Test::Unit::TestCase
  include PolygonalNumbers

  def unique_triangles
    triangles = triangle_sequence
    pentagonals = pentagonal_sequence
    hexagonals = hexagonal_sequence

    unique = []
    triangles.each do |triangle|
      unique << triangle if pentagonals.include?(triangle) && hexagonals.include?(triangle)
    end
    unique
  end

  def test_second_trianlge_pentagonal_and_hexagonal_number_same_time
    assert_equal 1_533_776_805, unique_triangles.last
  end
end
