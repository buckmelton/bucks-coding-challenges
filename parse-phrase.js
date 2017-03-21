/*

Parse a phrase to create letter frequency counts.

Example:
Input: "Sally sells seashells down by the seashore."
Output: [{"char":"s","count":"7"},{"char":"a","count":"3"},{"char":"l","count":"6"}, ... ]

Pseudocode:
Create object to act as hash for characters
For each character
  If character is already a key in the object
    Increment value for that key
  Else
    Add key to the object with value 1
Create array
  For each key in object
    Create an object of form {"char":"<char>", "count":"<count"}
      and push the object onto the array

*/

function parsePhrase(str) {

  // We're counting in a case-insensitive manner
  str = str.toLowerCase();

  // Create object to act as hash for characters.
  var charFreqs = {};

  // Go through each character and count up frequencies.
  for (var i=0; i<str.length; i++) {
    if (str[i] in charFreqs) {
      charFreqs[str[i]]++;
    } else {
      charFreqs[str[i]] = 1;
    }
  }

  // Convert frequency object into specified array of objects.
  var freqArray = [];
  for (var char in charFreqs) {
    var elem = {};
    elem.char = char;
    elem.count = (charFreqs[char]).toString();
    freqArray.push(elem);
  }

  return freqArray;

}

/*
Driver code to test.
*/

console.log(parsePhrase("Sally sells seashells down by the seashore."));
