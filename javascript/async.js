const triggerActions = count => {
    let callList = [];
    for(let i = 1; i <= count; i++) {
      callList.push( 
				new Promise((resolve, reject) => {
          return processAction(i, str => resolve(str));
        })
			);
    }
		let promises = []
    Promise.all(callList)
    	.then(results => {
      	results.forEach(res => {
					console.log(res);
					promises.push(res);
				})
			})
			.then(res => {
				console.log("promises, ", promises);
				return promises.join("\n");
			});
		// return promises;
}


function processAction(i, callback) {
  setTimeout(function() {
    callback("Processed Action " + i);
  }, Math.random()*1000);
}