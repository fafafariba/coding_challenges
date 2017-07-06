describe("Pairs", function() {


  it("should return an empty array when given an empty array", function() {
    expect(pairs([], 5)).toBeEmptyArray();
  });

  it("should return an empty array when no pairs equal k", function() {
    expect(pairs([7, 1, 3, -1, 0], 5)).toBeEmptyArray();
  });

	it("should return one pair when single pair equal k", function() {
		let result = pairs([12, 10, 15, -1, 7, 6, 5, 4, 2, 1], 10)
		expect(result).toBeEquivalentToArray([4, 6]);
	});

	it("should return an array of multiple pairs when multiple pairs equal k", function() {
		var result = pairs([9, -6, 10, 5, 15, 3, -4, 1], 11);
		expect(result).toEqual([[-4, 15], [1, 10]]);
	});
});