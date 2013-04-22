require_relative 'tools/graph'
require_relative 'tools/node'
class Graph
	class << self
		def from_file(path)
			rows = {}
			graph = Graph.new
			File.open(path) do |file|
				file.each_with_index do |line, line_index|
					values = line.chomp.split(' ').map(&:to_i)
					rows[line_index] = values
				end 
			end
			rows.each do |row_key,row_values|
				row_values.each_with_index do |_,index|
					node = Node.new "#{row_key}_#{index}"
          graph.add_node node

					next_row = row_key + 1
					if rows.include? next_row
						level_down = rows[next_row]
						graph.add_edge node, Node.new("#{next_row}_#{index}") , level_down[index]
						graph.add_edge node, Node.new("#{next_row}_#{index+1}"), level_down[index+1] if index + 1 < level_down.length
					end
				end
			end
			graph
		end
	end
end

graph = Graph.from_file('data/problem_18_data.txt')

p result = graph.dijkstra('0_0').sort_by { |k,v| k}

p result.max_by { |k,v| v}





