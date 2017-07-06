// Problem: Given a sequence of nonnegative integers A and an integer T, return whether there is a *continuous sequence* of A that sums up to exactly T

// Examples 
// [23, 5, 4, 7, 2, 11], 20. Return True because 7 + 2 + 11 = 20
// [1, 3, 5, 23, 2], 8. Return True because 3 + 5 = 8
// [1, 3, 5, 23, 2], 7 Return False because no sequence in this array adds up to 7

const continuousSequence = (arr, t) => {

	let sum = 0;
	let i = 0;
	let j = 0;
	while (j < arr.length) {
		sum = sum + arr[j];
		if (sum === 20) {
			return arr.slice(i, j+1);
		} else if (sum < 20) {
			j++;
		} else {
			while (sum > 20 && i <= j) {
				sum = sum - arr[i];
				i = i + 1;
				if(sum === 20) return arr.slice(i, j+1);
			}
			j++;
		}
	}
	return [];
}

