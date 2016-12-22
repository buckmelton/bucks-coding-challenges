class Heap {

  // MinHeap and MaxHeap are implemented as arrays.  Formulas relate the index
  // relationship between parent and child.  Root is index 0, left child of
  // root is 1, right child of root is 2, left child of index 1 is 3, etc.

  constructor() {
    this.heap = [];
    this.size = 0;
  }

  getLeftChildIndex(parentIndex) {
    return (parentIndex * 2) + 1;
  }

  getRightChildIndex(parentIndex) {
    return (parentIndex * 2) + 2;
  }

  getParentIndex(childIndex) {
    if (childIndex % 2 == 0) {
      return Math.floor((childIndex - 1) / 2);
    } else {
      return Math.floor(childIndex / 2);
    }
  }

  // Swap two elements of the array.
  swap(index1, index2) {
    var swapTemp = this.heap[index1];
    this.heap[index1] = this.heap[index2];
    this.heap[index2] = swapTemp;
  }

  // Insert into a min/max heap:
  // Add the new value to the end of the array (corresponding to the next
  // open spot in a min/max heap tree), then move it up the tree until it's
  // parent is less (min heap) or greater (max heap).
  insert(newVal) {
    this.heap[this.size] = newVal;
    this.swapUp(this.size);
    this.size++;
  }

  // Remove the root.  Replace root with last element, and move the root down
  // until it is less than (max heap) or greater than (min heap) its parent.
  extract() {
    var min = this.heap[0];
    this.heap[0] = this.heap[this.size-1]
    this.swapDown(0);
    this.size--;
    return min;
  }

  peek() {
    return this.heap[0];
  }

}

class MinHeap extends Heap {

  swapUp(startIndex) {
    var curIndex = startIndex;
    var parentIndex = this.getParentIndex(curIndex);
    while (parentIndex >= 0 && this.heap[curIndex] < this.heap[parentIndex]) {
      this.swap(curIndex, parentIndex);
      curIndex = parentIndex;
      parentIndex = this.getParentIndex(curIndex);
    }
  }

  swapDown(startIndex) {
    var curIndex = startIndex;
    var leftChildIndex = this.getLeftChildIndex(curIndex);
    var rightChildIndex = this.getRightChildIndex(curIndex);
    var minChildIndex = this.heap[leftChildIndex] < this.heap[rightChildIndex] ? leftChildIndex : rightChildIndex;
    while (minChildIndex < this.size && this.heap[curIndex] > this.heap[minChildIndex]) {
      this.swap(curIndex, minChildIndex);
      curIndex = minChildIndex;
      leftChildIndex = this.getLeftChildIndex(curIndex);
      rightChildIndex = this.getRightChildIndex(curIndex);
      minChildIndex = this.heap[leftChildIndex] < this.heap[rightChildIndex] ? leftChildIndex : rightChildIndex;
    }
  }

}

class MaxHeap extends Heap {

  swapUp(startIndex) {
    var curIndex = startIndex;
    var parentIndex = this.getParentIndex(curIndex);
    while (parentIndex >= 0 && this.heap[curIndex] > this.heap[parentIndex]) {
      this.swap(curIndex, parentIndex);
      curIndex = parentIndex;
      parentIndex = this.getParentIndex(curIndex);
    }
  }

  swapDown(startIndex) {
    var curIndex = startIndex;
    var leftChildIndex = getLeftChildIndex(curIndex);
    var rightChildIndex = getRightChildIndex(curIndex);
    var maxChildIndex = this.heap[leftChildIndex] > this.heap[rightChildIndex] ? leftChildIndex : rightChildIndex;
    while (maxChildIndex < this.size && this.heap[curIndex] < this.heap[maxChildIndex]) {
      swap(curIndex, maxChildIndex);
      curIndex = maxChildIndex;
      leftChildIndex = getLeftChildIndex(curIndex);
      rightChildIndex = getRightChildIndex(curIndex);
      maxChildIndex = this.heap[leftChildIndex] > this.heap[rightChildIndex] ? leftChildIndex : rightChildIndex;
    }
  }
}

/*******************************************************/

function getMedian(theInts) {
  // To find the median of an arbitrary length array, assign each element
  // to a min heap or max heap, where the two heaps are kept the same size
  // or only off by one, and the root of the max heap is less than (or equal to
  // the root of the min heap.  The median will then be the average of the
  // two roots, or the root of the heap that has an extra element.

  var minH = new MinHeap;
  var maxH = new MaxHeap;

  // Seed min heap with first element of array.
  minH.insert(theInts[0]);

  // Assign each element of array to min heap or max heap, keeping the heaps
  // the same size or only differing by one at all times.
  var minRoot;
  for (let i=1; i<theInts.length; i++) {
    if (theInts[i] >= minH.peek()) {
      minH.insert(theInts[i]);
    } else {
      maxH.insert(theInts[i]);
    }

    if (minH.size > maxH.size + 1) {
      maxH.insert(minH.extract());
    } else {
      if (maxH.size > minH.size + 1) {
        minH.insert(maxH.extract());
      }
    }
  }

  // Edge cases if one or both heaps are empty (i.e. 0 or 1 elements in array).
  if (minH.size === 0) {
    if (maxH.size === 0) {
      return null;
    }
  }
  if (maxH.size === 0) {
    return minH.peek();
  }

  // Median is root of larger heap, or if heaps are the same size, the average
  // of the two roots.
  if (minH.size === maxH.size) {
    return Math.floor(minH.peek() + maxH.peek()) / 2;
  } else {
    if (minH.size < maxH.size) {
      return maxH.peek();
    }
    return minH.peek();
  }
}

/******************************************/
/* Put driver code for testing below here.
*/

arr1 = [4,2,1,5,3,9,6,8,7];
console.log('Median is: ' + getMedian(arr1));
