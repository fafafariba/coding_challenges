const triggerActions = require('./asyncIter.js');


test('returns 1, 2, 3, 4, 5 in order', () => {
  triggerActions(5);
	setTimeout(() => {
		expect(process.stdout).toContain([ 
			'Processed Action 1',
			'Processed Action 2',
			'Processed Action 3',
			'Processed Action 4',
			'Processed Action 5'
		]), 10000 });
})