class Link {
	constructor(value){
		this.prev = null;
		this.next = null;
		this.val = value;
	}
}

class LRUCache {
	constructor(limit) {
		this.first = null;
		this.last = null;
		this.cache = {};
		this.limit = limit;
		this.size = 0;
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
		this.size++;
	}

	setLast(){
		if (this.size === this.limit) {
			let newLast = this.last.prev;
			newLast.next = null; 
			this.last.prev = null;
			delete this.cache[this.last.val];
			this.size--;
			this.last = newLast
		}
	}
}

const implementLRUCache = (arr, limit) => {
	let lruCache = new LRUCache(limit);
	arr.forEach( val => lruCache.append(val));
	let result = [];
	let link = lruCache.first;
	while (link) {
		result.push(link.val);
		link = link.next;
	}
	return result;
}