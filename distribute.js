/*
Given an amount of money to distribute, a list of recipients, and how much money each is owed,
return the list of recipients and how much each would be paid after following the business logic below:

- no recipient is paid more than they are owed
- the amount is divided as evenly as possible between the recipients

Input: { c: 10, b: 10, a: 10, d: 10 } , 38
Output: { c: 9, b: 10, a: 10, d: 9 }

*/

function distribute(recipients, amount) {
  let distributions = { ...recipients };
  
  let totalOwed = 0;
  for (const dist in distributions) {
    totalOwed += distributions[dist];
  }
    
  if (amount > totalOwed) {
    return distributions;
  }
  
  // if we don't have enought to pay everyone, split
  // what we do have evenly amonst the recipients
  let numRecipients = Object.keys(recipients).length;
  let distPerRecipient = Math.floor(amount / numRecipients);
  let remainder = amount % numRecipients;
  for (dist in distributions) {
    distributions[dist] = distPerRecipient;
  }
  
  let i = 1;
  for (const dist in distributions) {
    if ( i <= remainder ) {
      distributions[dist] += 1;
    } else {
      break;
    }
    i += 1;
  } 
  
  // There may be some distributions that are greater than the recipient is owed.
  // Roll back the extra distributions and distribute the excess amount to the other recipients.
  let excessAmount = 0;
  for (const dist in distributions) {
    if (distributions[dist] > recipients[dist]) {
      excessAmount += distributions[dist] - recipients[dist];
      distributions[dist] = recipients[dist];
    }
  }
  while (excessAmount > 0) {
    for (const dist in distributions) {
      if (distributions[dist] < recipients[dist]) {
        distributions[dist] += 1;
        excessAmount -= 1;
      }
      if (excessAmount == 0) {
        break;
      }
    }
  }
  
  return distributions;
}

console.log( distribute( { a: 2, b: 15, c: 3, d: 100 }, 80 ) );
console.log( distribute( { a: 10, b: 10, c:10, d: 10 }, 40 ) );
console.log( distribute( { a: 10, b: 10, c:10, d: 10 }, 32 ) );
console.log( distribute( { a: 10, b: 10, c:10, d: 10 }, 34 ) );
