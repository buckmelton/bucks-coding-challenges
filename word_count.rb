=begin

Input: string that's a sentence with spaces and punctuation
Output: List of unique words with their frequency, sorted by frequency in descending order.

Pseudocode:
Create an array of words from string (getting rid of spaces and punctuation)
Create hash
For each word in array
   If not in hash
      Put word in hash with freq = 1
   Else
      Increment freq of word
Sort the hash by frequency

=end

def word_count(text)

   freq_hash = {}

   text = text.downcase.gsub(/[^a-z\s]/, '')
   puts text
  #  text = text.gsub(/\s/, ' ')
  #  puts text
   word_arr = text.split
   p word_arr

   word_arr.each do |word|

      if freq_hash.has_key?(word)
         freq_hash[word] += 1
      else
         freq_hash[word] = 1
      end

   end

   # At this point, hash contains all unique words with their frequencies, but not sorted
   freq_arr = freq_hash.sort {|a, b| b[1]<=>a[1]}

   return freq_arr

end

##############################################
# Driver code for testing

p word_count("Practice   makes perfect.  It's perfect      to practice, so just practice!")
