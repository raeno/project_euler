# What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20x20 grid?
# Grid located in a data/problem_11_grid.txt
require 'matrix'

rows = []
File.foreach("data/problem_11_grid.txt") { |line| rows << line.chomp.split(' ').map(&:to_i)  }
grid = Matrix.rows rows


def find_all_products_in_matrix(matrix)
	products = []

	(0...matrix.row_size).each { |row_index| products << matrix.row(row_index).inject(1) { |mem, var| mem *= var  } }
	(0...matrix.column_size).each { |col_index| products << matrix.column(col_index).inject(1) { |mem, var| mem *= var  }}
	
	# products for both matrix diagonals
	products << (0...matrix.row_size).map { |i| matrix[i,i] }.inject(1) { |mem, var| mem *= var  }
	products << (0...matrix.row_size).map { |i| matrix[matrix.row_size - i -1,i] }.inject(1) { |mem, var| mem*= var  }
end

def matrix_max_product(matrix)
	products = find_all_products_in_matrix(matrix)
	products.max
end

def to_n_size_matrices(matrix, n)
	return [matrix] if n >= matrix.row_size || n >= matrix.column_size

	submatrices = []
	row_index = n
	while row_index <= matrix.row_size do 
		col_index = n
		while col_index <= matrix.column_size do
			submatrices <<  matrix.minor(row_index-n...row_index, col_index-n...col_index)
			col_index += 1
		end
		row_index += 1
	end
	submatrices
end

p to_n_size_matrices(grid,4).map { |matrix| matrix_max_product(matrix)}.max


