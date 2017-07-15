describe("LRU Cache", () => {

	describe("When given nothing to cache", () => {
		it("should return an empty array", () => {
			expect(implementLRUCache([], 0)).toEqual([]);
		});
	});

	describe("When given less than cache size", () => {
		
		let n = 3;
		let cache1 = implementLRUCache(["one"], n);
		let cache2 = implementLRUCache(["one", "two"], n);
		let cache3 = implementLRUCache(["one", "two", "three"], n);

		it("should not eject any items from cache", () => {
			expect(cache1.length).toEqual(1);
			expect(cache2.length).toEqual(2);
			expect(cache3.length).toEqual(3);
		});

		it("should return the cache in reverse order", ()=> {
			expect(cache1).toEqual(["one"]);
			expect(cache2).toEqual(["two", "one"]);
			expect(cache3).toEqual(["three", "two", "one"])
		});
	});

	describe("When given greater than cach size", () => {
		let n = 3;
		let cache = implementLRUCache(["one", "two", "three", "four", "five"], n);

		it("should return no more than cache size", () => {
			expect(cache.length).toEqual(3);
		});

		it("should return the n most recently added items", () => {
			expect(cache).toEqual(["five","four","three"]);
		});
	});
});