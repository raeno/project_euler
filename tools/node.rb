class Node
	attr_reader :name, :connected

	attr_accessor :lengths

	def initialize(name, connected = nil, lengths = nil)
	  @name = name
	  @connected = connected || []
	  @lengths = lengths || {}
	end

	def ==(another_node)
	  self.name == another_node.name
	end

	def add_edge(node, length = 1)
	  @connected << node
	  @lengths[node.name] = length
	end

	def to_s
	  "#{@name} -> [#{@connected.map(&:name).join(' ')}]"
	end

end
