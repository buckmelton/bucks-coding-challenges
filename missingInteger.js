/*
Codility MissingInteger

GIVEN PROBLEM:
  Write a function:

  function solution(A);

  that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

  For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

  Given A = [1, 2, 3], the function should return 4.

  Given A = [−1, −3], the function should return 1.

  Write an efficient algorithm for the following assumptions:

  N is an integer within the range [1..100,000];
  each element of array A is an integer within the range [−1,000,000..1,000,000].

MY NOTES:
  Pseudocode:
  Create an array indexPresent whose index values represent the numbers found in A.
  Traverse array once with index i
      For each number in A >= 0
      Set indexPresent[A[i]] to true
  Assert: For each integer n >=0 in A, indexPresent[n] is true
  Assert: For each number n >= in A, indexPresent[n] is undefined
  Loop through indexPresent from the beginning
      Return the index of the first undefined array element as the answer
  If we exit the loop normally, either the array was empty (meaning all nums in A were negative
    or A itself contained no number), or there are no discontinuities in A, meaning the answer
    is the index just past the end of indexPresent

Complexity:
Time: O(N) for 1st array pass + O(N) for 2nd array pass = O(2N) = O(N), where N is the size of the array A
Space: O(N) for the indexPresent array

*/

function solution(A) {
    let indexPresent = [];
    for (let i=0; i<A.length; i++) {
        if (A[i] >= 0 ) {
            indexPresent[A[i]] = true;
        }
    }
    for (let j=1; j<indexPresent.length; j++) {
        if (indexPresent[j] != true) {
            return j;
        }
    }
    return (indexPresent.length > 0 ? indexPresent.length : 1);
}
