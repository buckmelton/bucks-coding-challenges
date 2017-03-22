/*
Write a program that prints a staircase of size n.

Input Format:
A single integer, n, denoting the size of the staircase.

Output Format:
Print a staircase of size n using # symbols and spaces.

Note: The last line must have 0 spaces in it.

Sample Input:
6

Sample Output:

     #
    ##
   ###
  ####
 #####
######

*/

function printStaircase(n) {
    var staircase = "";
    for (var i=0; i<n; i++) {
        for (var j=0; j<n-i-1; j++) {
            staircase += " ";
        }
        for (var j=n-i-1; j<n; j++) {
            staircase += "#";
        }
        staircase += "\n";
    }
    console.log(staircase);
}

/* Driver code to test */
printStaircase(6);
