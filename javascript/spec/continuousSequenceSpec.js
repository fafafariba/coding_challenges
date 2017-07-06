describe("Continuous Sequence", () => {

  it("should return false when given an empty array", () => {
    expect(continuousSequence([], 5)).toBe(false);
  });

  it("should return true when continuous sequence exists", () => {
    expect(continuousSequence([23, 5, 4, 7, 2, 11], 20)).toBe(true);
  });

  it("should return true when continuous sequence exists and array has duplicate values", () => {
    expect(continuousSequence([5, 5, 5, 5], 20)).toBe(true);
  });

  it("should return false when continuous sequence doesn't exist", () => {
    expect(continuousSequence([1, 3, 5, 23, 2], 7)).toBe(false);
  });

	
});