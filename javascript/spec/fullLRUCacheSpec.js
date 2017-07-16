describe("LRU Cache", () => {

	// describe("When given nothing to cache", () => {
	// 	it("should return an empty object", () => {
	// 		expect(implementLRUCache({}, 0).returnCache()).toEqual({});
	// 	});
	// });

	// describe("When given null to cache", () => {
	// 	it("should return an empty array", () => {
	// 		expect(implementLRUCache(null, 0).returnCache()).toEqual({});
	// 	});
	// });

	// describe("When given less than cache size", () => {
		
	// 	let n = 3;
	// 	let cache1 = implementLRUCache({"id1": "object1"}, n);
	// 	let cache2 = implementLRUCache({"id1": "object1", "id2": "object2"}, n);
	// 	let cache3 = implementLRUCache({"id1": "object1", "id2": "object2", "id3": "object3"}, n);

	// 	it("should not remove any items from cache", () => {
	// 		expect(cache1.size).toEqual(1);
	// 		expect(cache2.size).toEqual(2);
	// 		expect(cache3.size).toEqual(3);
	// 	});

	// 	it("should return the cache in reverse order", ()=> {
	// 		expect(cache1.returnCache()).toEqual({"id1": "object1"});
	// 		expect(cache2.returnCache()).toEqual({"id1": "object1", "id2": "object2"});
	// 		expect(cache3.returnCache()).toEqual({"id1": "object1", "id2": "object2", "id3": "object3"})
	// 	});
	// });

	// describe("When given greater than cache size", () => {
	// 	let objs = {"id1": "object1", "id2": "object2", "id3": "object3", "id4": "object4", "id5": "object5"}
	// 	let n = 3;
	// 	let cache = implementLRUCache(objs, n);

	// 	it("should return no more than cache size", () => {
	// 		expect(cache.size).toEqual(n);
	// 	});

	// 	it("should return the n most recently added items", () => {
	// 		expect(cache.returnCache()).toEqual({"id5": "object5", "id4": "object4", "id3": "object3"});
	// 	});
	// });

	describe("When accessing an item", () => {
		let objs = {"id1": "object1", "id2": "object2", "id3": "object3"}
		let n = 3;
		let cache = implementLRUCache(objs, n);
		let get1 = cache.get("id2");
		let get2 = cache.get("id7");
		let newCache = cache.returnCache();

		it("should return no more than cache size", () => {
			expect(cache.size).toEqual(n);
		});

		it("should return get value if object exists", () => {
			expect(get1).toEqual("object2");
		});

		it("should return an error if object doesn't exist", () => {
			expect(get2).toMatch(/Error: Item does not exist/);
		});

		it("should return the items in most recently accessed order", () => {
			expect(newCache).toEqual({"id2": "object2", "id3": "object3", "id1": "object1"});
		});
	});

	describe("When updating an item", () => {
		let n = 4;
		let cache = implementLRUCache({"id1": "object1", "id2": "object2", "id3": "object3"}, n);
		let update1 = cache.update("id2", "object5");
		let newCache = cache.returnCache();
		let update2 = cache.update("id5", "object18");

		it("should return same cache size", () => {
			expect(cache.size).toEqual(3);
		});

		it("should update the value", () => {
			expect(newCache["id2"]=="object2").toBe(false);
			expect(update1).toEqual("object5");
		});

		it("should return an error if object doesn't exist", () => {
			expect(update2).toMatch(/Error: Item does not exist/);
		});

		it("should return the items in most recently accessed order", () => {
			expect(newCache).toEqual({"id2": "object5","id3": "object3","id1" :"object1"});
		});
	
		describe("When the tail is updated", () => {
			objs = {"id1": "object1", "id2": "object2", "id3": "object3", "id4": "object4", "id5": "object5"};
			let n = 5;
			let cache = implementLRUCache(objs, n);
			let update = cache.update("id1", "tail");
			let newCache = cache.returnCache();
			
			it("should return same cache size", () => {
				expect(cache.size).toEqual(n);
			});

			it("should update the value", () => {
				expect(newCache["id1"]==="object1").toBe(false);
				expect(update).toEqual("tail");
			});

			it("should return the items in most recently accessed order", () => {
				expect(cache.returnCache()).toEqual({"id1": "tail", "id5": "object5", "id2": "object2", "id3": "object3", "id4": "object4"});
			});
		});

		describe("When the tail is updated", () => {
			let objs = {"id1": "object1", "id2": "object2", "id3": "object3", "id4": "object4", "id5": "object5"}
			let n = 5;
			let cache = implementLRUCache(objs, n);
			let update = cache.update("id5", "head");
			let newCache = cache.returnCache();
			
			it("should return same cache size", () => {
				expect(cache.size).toEqual(n);
			});

			it("should update the value", () => {
				expect(newCache["id5"]==="object5").toBe(false);
				expect(update).toEqual("head");
			});

			it("should return the items in most recently accessed order", () => {
				expect(cache.returnCache()).toEqual({"id5":"head","id4": "object4", "id3": "object3", "id2": "object2", "id1": "object1"});
			});
		});
	});
});