class Link {
	constructor(value){
		this.prev = null;
		this.next = null;
		this.val = value;
	}
}

class LRUCache {
	constructor(size) {
		this.first = null;
		this.last = null;
		this.cache = {};
		this.size = size;
	}

	append(value) {
		let link = new Link(value);
		if (!this.first) {
			this.first = link;
			this.last = link;
		} else {
			link.next = this.first;
			this.first.prev = link;
			this.first = link;
			this.setLast();
		}

		this.cache[link.val]=link
	}

	setLast(){
		// console.log("cache: ", this.cache);
		if (Object.keys(this.cache).length === this.size) {
			let newLast = this.last.prev;
			newLast.next = null; 
			this.last.prev = null;
			delete this.cache[this.last.val];
			this.last = newLast
		}
	}
}

const implementLRUCache = (arr, size) => {
	let lruCache = new LRUCache(size);
	arr.forEach( val => lruCache.append(val));
	let result = [];
	let link = lruCache.first;
	while (link) {
		result.push(link.val);
		link = link.next;
	}
	return result;
}