# Practice with Functional Programming.
# Compute the average height of a list of people (some of which don't have a height listed).

def avg_height_functional(people)

  people_with_height = people.select {|person| person.has_key?('height')}
  total_height = people_with_height.reduce(0) {|acc, person| acc += person['height']}
  return total_height / people_with_height.length

end

############################################
# Driver code to test.


people = [{'name' => 'Mary', 'height' => 160},
          {'name' => 'Isla', 'height' => 80},
          {'name' => 'Sam'}]

puts avg_height_functional(people)
