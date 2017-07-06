describe("Continuous Sequence", () => {


  it("should return false when given an empty array", () => {
    expect(continuousSquence([], 5)).toBeFalsy();
  });

  it("should return true when continuous sequence exists", () => {
    expect(continuousSquence([23, 5, 4, 7, 2, 11], 20)).toBeTruthy();
  });

  it("should return true when continuous sequence exists and array has duplicate values", () => {
    expect(continuousSquence([5, 5, 5, 5], 20)).toBeTruthy();
  });

  it("should return false when continuous sequence doesn't exist", () => {
    expect(continuousSquence([1, 3, 5, 23, 2], 7)).toBeFalsy();
  });

	
});