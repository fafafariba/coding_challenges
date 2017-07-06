beforeEach(function () {
  // jasmine.addMatchers({
  //   toBePlaying: function () {
  //     return {
  //       compare: function (actual, expected) {
  //         var player = actual;

  //         return {
  //           pass: player.currentlyPlayingSong === expected && player.isPlaying
  //         };
  //       }
  //     };
  //   }
  // });
  jasmine.addMatchers({
    toBeEquivalentToArray: function(util, customEqualityTesters) {
      return {
        compare: function(actual, expected) {
          var flatten_a = actual.reduce(function(a,b) {
            return a.concat(b);
          }, []);
          var flatten_e = expected.reduce(function(a, b){
            return a.concat(b);
          }, []);

          var equalArrays = function (arr1, arr2) {
            for(var i = 0; i < arr1.length; i++) {
              if (arr1[i] !== arr2[i]) return false;
            }
            return true 
          }
          // console.log(isEqual(flatten_a.sort(), flatten_e.sort())); 
          var passed = equalArrays(flatten_a.sort(), flatten_e.sort());
          return {
            pass: passed,
            message: 'Expected ' + actual + (passed ? '' : ' not') + ' to equal ' + expected
          };
        }
      };
    }
  });
});
