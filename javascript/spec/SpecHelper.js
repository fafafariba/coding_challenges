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
          });
          var flatten_e = expected.reduce(function(a, b){
            return a.concat(b);
          }) 
          var passed = flatten_a.sort() === flatten_e.sort();
          return {
            pass: passed,
            message: 'Expected ' + actual + (passed ? '' : ' not') + ' to equal ' + expected
          };
        }
      };
    }
  });
});
