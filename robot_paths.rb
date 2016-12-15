=begin

Given an N x N matrix, determine the number of paths a robot can take to get
from the top-left corner to the bottom-right corner if it can go right, left,
up, or down, but it can't re-visit any location.

Source: Given to me as a whiteboarding exercise at Outco.

Analysis:
This is a typical depth-first search.  We must visit all nodes and all possible
paths.

=end

# Is x,y a valid coordinate in an nxn matrix?
def invalid?(n,x,y)
  return x < 0 || y < 0 || x > n-1 || y > n-1
end

def robot_paths(n)
  num_paths = 0
  visited = {};

  dfs = lambda do |x,y|

    # Return if this is not a valid location, or if we've already visited this location.
    return if invalid?(n,x,y)
    return if visited.has_key?([x,y])

    # If we're at the bottom-right, we've found another path and can backtrack.
    if x == n-1 && y == n-1
      num_paths += 1
      return
    end

    # We're at a valid location and it's not the bottom-right.  Mark this
    # location as visited and try moving
    # forward in all four possible directions.
    visited[[x,y]] = true
    dfs.call(x+1,y)
    dfs.call(x,y+1)
    dfs.call(x-1,y)
    dfs.call(x,y-1)

    # We've checked out ALL the possible paths from the current location, so
    # we can backtrack, which means we need to mark it as not visited.
    visited.delete([x,y])

  end

  # Start in top-left corner.
  dfs.call(0,0)

  return num_paths
end

#######################################################################
# Driver code for testing

n = 5
n.times do |i|
  puts "The number of paths in an #{i} by #{i} matrix is: #{robot_paths(i)}."
end
