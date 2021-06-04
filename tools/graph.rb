# frozen_string_literal: true

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.name] = node
  end

  def add_edge(source, connected, length = 1)
    add_node source unless @nodes.key? source.name
    add_node connected unless @nodes.key? connected.name

    @nodes[source.name].add_edge @nodes[connected.name], length unless @nodes[source.name].connected.include? connected
    self
  end

  def [](name)
    @nodes[name]
  end

  def to_s
    @nodes.map(&:to_s).join(' ')
  end

  # rubocop:disable Metrics/AbcSize
  def dijkstra(start_node_name)
    start_node = nodes[start_node_name]
    calculated = [start_node]

    distances = { start_node.name => 75 }

    until calculated.count == nodes.count
      crossing_edges = []
      calculated.each do |our|
        our.connected.each do |their|
          unless calculated.include? their
            distance = distances[our.name] + our.lengths[their.name]
            crossing_edges << { head: our.name, tail: their.name, distance: distance }
          end
        end
      end

      # if we cannot find path from explored part to any other node in graph
      if crossing_edges.empty?
        nodes.each_value do |node|
          distances[node.name] = 1_000_000 unless calculated.include? node
        end
        break
      end

      nearest_node_edge = crossing_edges.max_by { |v| v[:distance] }
      nearest_node_name = nearest_node_edge[:tail]

      calculated << nodes[nearest_node_name]
      distances[nearest_node_name] = nearest_node_edge[:distance]
    end
    distances
  end
  # rubocop:enable Metrics/AbcSize
end
