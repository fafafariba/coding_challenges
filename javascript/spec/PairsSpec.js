describe("Pairs", () => {


  it("should return an empty array when given an empty array", () => {
    expect(pairs([], 5)).toEqual([]);
  });

  it("should return an empty array when no pairs equal k", () => {
    expect(pairs([7, 1, 3, -1, 0], 5)).toEqual([]);
  });

	it("should return one pair when single pair equal k", () => {
		let result = pairs([12, 10, 15, -1, 7, 6, 5, 4, 2, 1], 10)
		console.log("result ", result)
		expect(result).toBeEquivalentToArray([[4, 6]]);
	});

	it("should return an array of multiple pairs when multiple pairs equal k", () => {
		let result = pairs([9, -6, 10, 5, 15, 3, -4, 1], 11);
		expect(result).toBeEquivalentToArray([[-4, 15], [1, 10]]);
	});
});