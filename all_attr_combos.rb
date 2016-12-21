=begin

Given a hash of user attributes, return all combinations of those attributes.
Example:
  Input:
    user_attrs = {
        "country" : ["us", "ca", "mx"],
        "agerange" : ["0-9","10-19","20-29"],
        "gender" : ["male", "female"]
        ...
    }

  Output:
  country=us,agerange=0-9,gender=male
  country=us,agerange=0-9,gender=female
  country=us,agerange=10-19,gender=male
  country=us,agerange=10-19,gender=female
  ...
  country=mx,agerange=20-19,gender=female

Pseudocode:

(Base cases:)
If no keys, return empty array
If one key, return array of values

(Recursive case:)
Compute result for attrs minus first key
For each value of first key
  For each element of result from attrs minus first key
    Prepend cur value of first key
    Push onto new result list
  end
end
Return new result list

=end

def all_attr_combos(attrs)

  # Base cases
  return [] if attrs.length == 0
  if attrs.length == 1
    key = attrs.keys[0]
    return attrs[key].map {|e| key + "=" + e}
  end

  # Recursive case

  # Slice off first key
  attrs_minus = attrs.clone
  key = attrs.keys[0]
  attrs_minus.delete(key)

  # Recursively find result on attrs minus first key
  result = all_attr_combos(attrs_minus)

  # For each value of the first key, combine it with all the results from the
  # lower recursive cases
  values = attrs[key]
  new_combos = []
  values.each do |value|
    prepend = key + "=" + value + ","
    result.each do |combo|
      new_combo = prepend + combo
      new_combos << new_combo
    end
  end

  return new_combos

end

#############################################
# Driver code to test.

user_attrs = {
   "country" => ["us", "ca", "mx"],
   "agerange" => ["0-9","10-19","20-29"],
   "gender" => ["male", "female"],
   "lang" => ['english', 'spanish', 'french']
}

all_attr_combos(user_attrs).each do |combo|
  puts combo
end
