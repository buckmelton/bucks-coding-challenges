=begin

From 'Advent of Code 2016'

You're airdropped near Easter Bunny Headquarters in a city somewhere. "Near", unfortunately, is as close as you can get - the instructions on the Easter Bunny Recruiting Document the Elves intercepted start here, and nobody had time to work them out further.

The Document indicates that you should start at the given coordinates (where you just landed) and face North. Then, follow the provided sequence: either turn left (L) or right (R) 90 degrees, then walk forward the given number of blocks, ending at a new intersection.

There's no time to follow such ridiculous instructions on foot, though, so you take a moment and work out the destination. Given that you can only walk on the street grid of the city, how far is the shortest path to the destination?

For example:

Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away.
R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away.
R5, L5, R5, R3 leaves you 12 blocks away.
How many blocks away is Easter Bunny HQ?

=end

def new_facing(cur_facing, dir)
  if cur_facing == :north && dir == "R" || cur_facing == :south && dir == "L"
    return :east
  elsif cur_facing == :east && dir == "R" || cur_facing == :west && dir == "L"
    return :south
  elsif cur_facing == :south && dir == "R" || cur_facing == :north && dir == "L"
    return :west
  elsif cur_facing == :west && dir == "R" || cur_facing == :east && dir == "L"
    return :north
  end

  return nil
end

def update_location(cur_blocks_away, facing, blocks)

  north = cur_blocks_away[0]
  east = cur_blocks_away[1]

  if facing == :north
    north += blocks.to_i
  elsif facing == :east
    east += blocks.to_i
  elsif facing == :south
    north -= blocks.to_i
  elsif facing == :west
    east -= blocks.to_i
  else
    return nil
  end

  return [north, east]

end

def visit_path_locations(loc1, loc2, facing, visited)

  if facing == :north
    for i in loc1[0]+1..loc2[0]
      loc_between = [i, loc1[1]]
      if visited[loc_between]
       return loc_between
      else
        puts "visiting: " + loc_between.to_s
        visited[loc_between] = true
      end
    end
  elsif facing == :east
    for i in loc1[1]+1..loc2[1]
      loc_between = [loc1[0], i]
      if visited[loc_between]
        return loc_between
      else
        puts "visiting: " + loc_between.to_s
        visited[loc_between] = true
      end
    end
  elsif facing == :south
    for i in loc2[0]..loc1[0]-1
      loc_between = [i, loc2[1]]
      if visited[loc_between]
        return loc_between
      else
        puts "visiting: " + loc_between.to_s
        visited[loc_between] = true
      end
    end
  elsif facing == :west
    for i in loc2[1]..loc1[1]-1
      loc_between = [loc2[0], i]
      if visited[loc_between]
        return loc_between
      else
        puts "visiting: " + loc_between.to_s
        visited[loc_between] = true
      end
    end
  end

  return nil

end

def distance_to_headquarters(route)

  route_arr = route.split(", ")

  visited = {}

  cur_blocks_away = [0,0] # 0 north and 0 east
  visited[cur_blocks_away] = true
  facing = :north

  route_arr.each do |instr|
    dir = instr[0]
    blocks = instr[1..-1]

    facing = new_facing(facing, dir)
    new_blocks_away = update_location(cur_blocks_away, facing, blocks)

    if (location = visit_path_locations(cur_blocks_away, new_blocks_away, facing, visited)) != nil
      return location[0].abs + location[1].abs
    end

    p visited

    cur_blocks_away = new_blocks_away

  end

  return blocks_away[0].abs + blocks_away[1].abs

end

route = "R2, L5, L4, L5, R4, R1, L4, R5, R3, R1, L1, L1, R4, L4, L1, R4, L4, R4, L3, R5, R4, R1, R3, L1, L1, R1, L2, R5, L4, L3, R1, L2, L2, R192, L3, R5, R48, R5, L2, R76, R4, R2, R1, L1, L5, L1, R185, L5, L1, R5, L4, R1, R3, L4, L3, R1, L5, R4, L4, R4, R5, L3, L1, L2, L4, L3, L4, R2, R2, L3, L5, R2, R5, L1, R1, L3, L5, L3, R4, L4, R3, L1, R5, L3, R2, R4, R2, L1, R3, L1, L3, L5, R4, R5, R2, R2, L5, L3, L1, L1, L5, L2, L3, R3, R3, L3, L4, L5, R2, L1, R1, R3, R4, L2, R1, L1, R3, R3, L4, L2, R5, R5, L1, R4, L5, L5, R1, L5, R4, R2, L1, L4, R1, L1, L1, L5, R3, R4, L2, R1, R2, R1, R1, R3, L5, R1, R4"

puts "Eastern Bunny Headquarters is #{distance_to_headquarters(route)} blocks away."
