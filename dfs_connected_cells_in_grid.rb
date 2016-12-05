n = gets.strip.to_i
m = gets.strip.to_i
grid = Array.new(n)
for grid_i in (0..n-1)
    grid_t = gets.strip
    grid[grid_i] = grid_t.split(' ').map(&:to_i)
end

def valid_cell(grid, neighbor)
    if neighbor[0] < 0 ||
            neighbor[0] > grid.length-1 ||
            neighbor[1] < 0 ||
            neighbor[1] > grid[0].length-1
        return false
    end
    return true
end

def count_connected_dfs(grid, i, j, visited)
    visited << [i,j]

    if grid[i][j] == 0
        return 0
    end

    connected = 1
    # for all neighbors
    neighbors =
        [[i-1,j-1],
         [i-1,j],
         [i-1,j+1],
         [i,j-1],
         [i,j+1],
         [i+1,j-1],
         [i+1,j],
         [i+1,j+1]]
    neighbors.each do |neighbor|
        # if neighbor valid && neighbor not visited
        if !visited.include?(neighbor) && valid_cell(grid, neighbor)
            # connected += process neighbor
            connected += count_connected_dfs(grid, neighbor[0], neighbor[1], visited)
        end
     end

    return connected

end

def get_region_size(grid, i, j)
    visited = []
    return count_connected_dfs(grid, i, j, visited)
end

def max_region(grid)
    max_region = 0
    for i in 0..grid.length-1
        for j in 0..grid[0].length-1
            region_size = get_region_size(grid, i, j)
            max_region = [region_size, max_region].max
        end
    end
    return max_region
end

puts max_region(grid)
