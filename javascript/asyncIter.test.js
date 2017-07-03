import triggerActions from './asyncIter.js';

test('returns 1, 2, 3, 4, 5 in order', () => {
	expect(triggerActions(5).toBe(1 + "\n" + 2 + "\n" + 3 + "\n" + 4 + "\n" + 5+ "\n"))
})