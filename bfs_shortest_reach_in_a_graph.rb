=begin

Source: HackerRank (Cracking The Coding Interview module)

For a series of undirected graphs, with all edges weighted 6, find and print the shortest distance from a given starting node to every other node.  If there is no path to a node, distance is -1.

Each graph is specified in a "query".
First line of query is number of nodes and number of edges.
Subsequent lines are the edges.
Last line of query is the starting node.

Example query:
Graph with 4 nodes, 2 edges (1,2 and 1,3), starting node 1:
4 2
1 2
1 3
1

Output:
6 6 -1

=end


class Graph

  attr_accessor :vertices

  def initialize
    @vertices = []
  end

  def set_all_unvisited
    @vertices.each {|vertex| vertex.visited = false}
  end

  # Standard breadth-first search
  def bfs_shortest(start, finish)

    # Clear visited
    set_all_unvisited

    # Set up queue for candidate vertices to search
    queue = []

    # Enqueue start node as first node, along with distance from start: zero
    queue << [start, 0]

    # while there are still nodes in the queue
    while queue.length > 0

      # dequeue a node
      vertex = queue.shift

      # if it's the finish node, we're done!
      if vertex[0] == finish
        return vertex[1]
      end

      # mark vertex as visited
      @vertices[vertex[0]-1].visited = true

      # otherwise, enqueue all the unvisited nodes that the current node is
      # connected to, along with a distance one greater than current node
      @vertices[vertex[0]-1].edges.each do |key,value|
        if !@vertices[key-1].visited
          queue << [key, vertex[1]+6]
        end
      end

    end

    return nil

  end

  def to_s
    puts "Graph:"
    @vertices.each do |vertex|
      puts "Vertex " + vertex.data.to_s + ", edges:"
      vertex.edges.each do |key, value|
        print key.to_s + " "
      end
      puts
      puts
    end
  end

end

class Vertex

  attr_accessor :data, :edges, :visited

  def initialize(data=nil)
    @data = data
    @edges = {} # Using hash to easily avoid duplicate edge entries for a vertex
    @visited = false
  end

end

=begin

Pseudocode:

Read number of queries
For each query
Read number of nodes and number of edges
Create nodes
Read edges
Create edges
Create result array, size is number of nodes
Read starting node
For each node except starting node
Find shortest distance from starting node to node
Put distance into result array
Print distances from result array

=end

def bfs_shortest_reach
  # Read number of queries
  num_queries = gets.strip.to_i

  # For each query
  results = []
  num_queries.times do |i|
    graph = Graph.new

    # Read number of nodes and number of edges
    num_vertices, num_edges = gets.strip.split(" ").map(&:to_i)

    # Create nodes
    num_vertices.times do |j|
      graph.vertices.push(Vertex.new(j+1))
    end

    # Read and create edges
    num_edges.times do |k|
      v1, v2 = gets.strip.split(" ").map(&:to_i)

      # taking advantage here: vertices are numbered 1 to n and are held in the
      # graph vertices 0-based array in that order
      graph.vertices[v1-1].edges[v2] = 1
      graph.vertices[v2-1].edges[v1] = 1
    end

    # At this point, the graph is created, now we can search

    # Read starting node
    start = gets.strip.to_i

    # For each node except starting node
    result = []
    graph.vertices.each do |vertex|
      if vertex.data != start
        distance = graph.bfs_shortest(start, vertex.data)
        if distance == nil
          distance = -1
        end
        result << distance
      end
    end

    results << result

  end

  return results
end

results = bfs_shortest_reach
results.each do |result|
  result.each do |distance|
    print distance.to_s + " "
  end
  puts
end
