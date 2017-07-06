describe("Continuous Sequence", () => {

  it("should return empty sequence when given an empty array", () => {
    expect(continuousSequence([], 5)).toEqual([]);
  });

  it("should return sequence when continuous sequence exists", () => {
    expect(continuousSequence([23, 5, 4, 7, 2, 11], 20)).toEqual([7, 2, 11]);
  });

  it("should return sequence if sequence is one element", () => {
    expect(continuousSequence([23, 5, 4, 7, 20, 11], 20)).toEqual([20]);
  });

  it("should return sequence when continuous sequence exists in array with duplicate values", () => {
    expect(continuousSequence([5, 5, 5, 5], 20)).toEqual([5, 5, 5, 5]);
  });

  it("should return sequence when continuous sequence doesn't exist", () => {
    expect(continuousSequence([1, 3, 5, 23, 2], 7)).toEqual([]);
  });

	
});