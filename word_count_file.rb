=begin

Input: text file
Output: List of unique words with their frequency, sorted by frequency in descending order.

Pseudocode:
Create hash
Open file
For each line in file
  Read line
  Create an array of words from line (getting rid of spaces and punctuation)
  For each word in array
     If not in hash
        Put word in hash with freq = 1
     Else
        Increment freq of word
Sort the hash by frequency

=end

def word_count_file(filename)

   freq_hash = {}

   File.open(filename).each do |line|

     # Get rid of everything except letters and whitespace
     line = line.downcase.gsub(/[^a-z\s]/, '')

     # Split on whitespace.  Gets rid of repeating whitespace chars.
     word_arr = line.split

     word_arr.each do |word|

        if freq_hash.has_key?(word)
           freq_hash[word] += 1
        else
           freq_hash[word] = 1
        end

     end

   end

   # At this point, hash contains all unique words with their frequencies, but not sorted
   freq_arr = freq_hash.sort {|a, b| b[1]<=>a[1]}

   return freq_arr

end

##############################################
# Driver code for testing

p word_count_file("word_count_file_test.txt")
