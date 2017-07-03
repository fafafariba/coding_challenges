// Log the response from each action in ascending order. ie.
// Processed Action 1
// Processed Action 2
// ...
// Processed Action 5

//function triggerActions(count) {
    // must call processAction
//}

// function processAction(i, callback) {
//   setTimeout(function() {
//     callback("Processed Action " + i);
//   }, Math.random()*1000);
// }



// recurisve
// export const triggerActions = (count, i = 1) => {
//   if (i > count) return;

//   const printStr = str => {
//     triggerActions(count, i + 1);
//     console.log(str);
//   }
// 	return processAction(i, printStr);
// }

// promises
export const triggerActions = count => {
    let callList = [];
    for(let i = 1; i <= count; i++) {
      callList.push( 
				new Promise((resolve, reject) => {
          return processAction((i, str) => resolve(str));
        })
			);
    }

    Promise.all(callList)
    	.then(results => {
      	results.forEach(res => res);
    });
}


const processAction = (i, callback) => {
  setTimeout( () => {
    callback("Processed Action " + i);
  }, Math.random()*1000);
}

// triggerActionsR(5);
//triggerActions(4);

