=begin

Source: HackerRank (Cracking The Coding Interview module)

THIS VERSION IMPLEMENTS A TWO-WAY BREADTH-FIRST SEARCH.

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
  attr_accessor :visited

  def initialize
    @vertices = []
  end

  # Two-way breadth-first search
  def bfs_shortest(start, finish)

    # Set up queues from both ends for candidate vertices to search
    queue_s = []
    queue_f = []

    # Set up hashes to track which vertices have been visited.
    # The key is the vertex' data/label and the value is the distance
    # from it's origin.
    # We're keeping distance in two places: queue and visited, and I feel like
    # there might be some way to only keep distance in one place, but I'm going
    # with this for now.
    visited_s = {}
    visited_f = {}

    # Enqueue and visit start and finish nodes as first nodes, along with distance from start/finish: zero
    queue_s << [start, 0]
    visited_s[start] = 0
    queue_f << [finish, 0]
    visited_f[finish] = 0

    # while there are still vertices in both queues
    # (In an undirected graph, if we've
    # exhausted all possibilities from one end, we know we can't meet from the other
    # end either, and can stop searching.  A directed graph would be different,
    # we'd have to keep checking from both ends.)
    while queue_s.length > 0 && queue_f.length > 0

      # Alternate searching from start vertex and from finish vertex.

      # From start vertex:
      # dequeue a vertex
      vertex_s = queue_s.shift

      # If the current vertex from start has been visited by path from finish, or
      # current vertex from finish has been visited by path from start,
      # we're done!  Return the sum of the distances of the meeting vertex from
      # from the start and from the finish.
      if visited_f.has_key?(vertex_s[0])
        return vertex_s[1] + visited_f[vertex_s[0]]
      end

      # mark vertex as visited, storing distance as well
      visited_s[vertex_s[0]] = vertex_s[1]

      # otherwise, enqueue all the unvisited nodes that the current node is
      # connected to, along with a distance one greater than current node
      @vertices[vertex_s[0]-1].edges.each do |key,value|
        if !visited_s.has_key?(key)
          queue_s << [key, vertex_s[1]+6]
        end
      end

      # Same as above, but from finish vertex:
      vertex_f = queue_f.shift

      if visited_s.has_key?(vertex_f[0])
        return vertex_f[1] + visited_s[vertex_f[0]]
      end

      visited_f[vertex_f[0]] = vertex_f[1]

      @vertices[vertex_f[0]-1].edges.each do |key,value|
        if !visited_f.has_key?(key)
          queue_f << [key, vertex_f[1]+6]
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

=begin

1
10 20
1 2
1 3
1 4
2 3
2 4
2 5
3 4
3 5
3 6
4 5
4 6
4 7
5 6
5 7
5 8
6 7
6 8
7 8
9 10


=end
