// A throttle function that will limit how frequently a function can be called.
// This is useful for example if you have some expensive handler on window resize.
// If someone is resizing a window, you don't want your expensive handler called for every pixel difference.
// Call it periodically.

// I investigated using setTimeout instead of pulling the current time, but couldn't get it to work.

// throttle.js

function throttle(callback, wait) {

  var prevTime = Date.now();

  return function() {
    var newTime = Date.now();
    
    if (newTime-prevTime >= wait) {
      prevTime = newTime;
      callback.call();
    }
  }

}

/**********************************/

// Driver code to test

function helloWorld() {
  console.log("Hello, World. It's now " + Date.now());
}

throttledHelloWorld = throttle(helloWorld, 2000);

var endTestTime = Date.now() + 30000; //  Run test for thirty seconds
while (Date.now() < endTestTime) {
  throttledHelloWorld();
}
