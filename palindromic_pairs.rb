=begin

Given an array of words, find all ordered pairs of unique indices such that
the two words concatenated form a palindrome.

Example 1:
Input: ["bat", "tab", "cat"]
Output: [[0, 1], [1, 0]]
(The palindromes are ["battab", "tabbat"])

Example 2:
Input: ["abcd", "dcba", "lls", "s", "sssll"]
Output: [[0, 1], [1, 0], [3, 2], [2, 4]]
(The palindromes are ["dcbaabcd", "abcddcba", "slls", "llssssll"])

Analysis:
The brute force method is very simple.  Go through each word.  For each word,
go through each other word.  If the two words concatenated for a palindrome,
push the pair of indices onto the result.  If there are n words and the average
word length is m, the time complexity is O(n^2 * m).  (For each of the n words,
you go through each of the n words.  Then for each n*n pair, you compare the
m letters in them to see if the two of them form a palindrome).

A faster method is to create a hash containing the reverse of each word (O(n)).
Then for the prefix of each word (O(n*m)), if the prefix is in the hash, see if
the rest of the word is a palindrome (O(n*m/2)).  If it is, the current word
concatenated with the hash word is a palindrome, insert into result.  Then do
the same thing for all the postfixes of the word.  This all adds up to
O(n) + O(n*m) + O(n*m/2) = O(n*m).

Pseudocode:

Create reverse-word hash
For each word
  Insert reverse of word into hash, reverse of word is key, index is value
For each word
  For each prefix of word
    If prefix is in hash and the rest of the word is a palindrome and prefix word isn't same entry as hash word
      Push [current word, hash word] onto result array
  For each postfix of word
    If postfix is in hash and the rest of the word is a palindrome and postfix word isn't same entry as hash word
      Push [current word, hash word] onto result array
Return result


=end

def palindrome?(word)

  for i in 0..word.length / 2
    if word[i] != word[word.length-1-i]
      return false
    end
  end
  return true

end

def palindromic_pairs(words)

  # result
  pairs = []

  # Put the reverse of each word into a hash.
  rev = {}
  words.each_with_index do |word, index|
    rev[word.reverse] = index
  end

  # Go through each word and see if any of its prefixes or postfixes are in the hash.
  # If so, if the rest of the word is a palindrome, we have a palindromic pair.
  words.each_with_index do |word, index|

    # Check prefixes
    for i in 0..word.length-1
      prefix = word[0..i]
      postfix = word[i+1..word.length-1]
      if rev.has_key?(prefix) && palindrome?(postfix)
        pairs << [index, rev[prefix]]
      end
    end

    # Check postfixes
    for i in 1..word.length-1
      prefix = word[0..word.length-1-i]
      postfix = word[word.length-i..word.length-1]
      if rev.has_key?(postfix) && palindrome?(prefix)
        pairs << [index, rev[postfix]]
      end
    end

  end

  return pairs

end


###################################################
# Driver code to test

#puts palindrome?("foo")

#words = ["bat", "tab", "cat"]
words = ["abcd", "dcba", "lls", "s", "sssll"]
p palindromic_pairs(words)
