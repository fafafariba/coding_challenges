
const pairs = (arr,k) => {
	arr.sort(compareNumbers = (a,b) => a - b);
	i = 0;
	j = arr.length - 1;
	results = [];
	while (i < j) {
		matchI = k - arr[i]
		matchJ = k - arr[j]
		if (matchI === arr[j]) {
			results.push([arr[i], arr[j]]);
			i++;
			j--;
		} else if (arr[i] > matchJ ) {
			j--;
		} else if (arr[j] < matchI) {
			i++;
		} 
	}
	return results;
}

// let a = [12, 10, 15, -1, 7, 6, 5, 4, 2, 1]
// console.log("pairs ", pairs(a, 10));