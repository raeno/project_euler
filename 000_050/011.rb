# frozen_string_literal: true

# What is the greatest product of four adjacent numbers in the same direction
# (up, down, left, right, or diagonally) in the 20x20 grid?
# Grid located in a data/problem_11_grid.txt
require 'matrix'
require 'test/unit'

class Matrix
  class << self
    def from_file(path)
      rows = []
      File.foreach(path) { |line| rows << line.chomp.split(' ').map(&:to_i) }
      Matrix.rows(rows)
    end
  end

  # rubocop:disable Metrics/AbcSize
  def find_all_products_in_matrix
    products = []

    (0...row_size).each { |row_index| products << row(row_index).inject(1) { |mem, var| mem * var } }
    (0...column_size).each { |col_index| products << column(col_index).inject(1) { |mem, var| mem * var } }

    # products for both matrix diagonals
    products << (0...row_size).map { |i| self[i, i] }.inject(1) { |mem, var| mem * var }
    products << (0...row_size).map { |i| self[row_size - i - 1, i] }.inject(1) { |mem, var| mem * var }
  end
  # rubocop:enable Metrics/AbcSize

  def max_product
    products = find_all_products_in_matrix
    products.max
  end

  def to_n_size_matrices(n)
    return [self] if n >= row_size || n >= column_size

    submatrices = []
    row_index = n
    while row_index <= row_size
      col_index = n
      while col_index <= column_size
        submatrices << minor(row_index - n...row_index, col_index - n...col_index)
        col_index += 1
      end
      row_index += 1
    end
    submatrices
  end
end

class TestProblem_11 < Test::Unit::TestCase
  def test_greatest_product_of_four_adj_numbers_in_the_20x20_matrix
    matrix = Matrix.from_file('data/problem_11_grid.txt')
    greatest_product = matrix.to_n_size_matrices(4).map(&:max_product).max
    assert_equal(70_600_674, greatest_product)
  end
end
