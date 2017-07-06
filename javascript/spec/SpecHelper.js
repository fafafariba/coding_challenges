beforeEach( () => {
  jasmine.addMatchers({
    toBeEquivalentToArray: (util, customEqualityTesters) => {
      return {
        compare: (actual, expected) => {
          const flatten_a = actual.reduce((a,b) => a.concat(b), []);
          const flatten_e = expected.reduce((a, b) => a.concat(b), []);

          const equalArrays = (arr1, arr2) => {
            for(let i = 0; i < arr1.length; i++) {
              if (arr1[i] !== arr2[i]) return false;
            }
            return true 
          }
          const passed = equalArrays(flatten_a.sort(), flatten_e.sort());
          return {
            pass: passed,
            message: 'Expected ' + actual + (passed ? '' : ' not') + ' to equal ' + expected
          };
        }
      };
    }
  });
});
