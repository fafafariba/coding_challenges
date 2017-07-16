class Link {
	constructor(value){
		this.prev = null;
		this.next = null;
		this.val = value;
	}
}

class LRUCache {
	constructor(limit) {
		this.head = null;
		this.tail = null;
		this.limit = limit;
		this.size = 0;
	}

	append(value) {
		if (value !== null) {
			let link = new Link(value);
			if (!this.head) {
				this.head = link;
				this.tail = link;
			} else {
				link.next = this.head;
				this.head.prev = link;
				this.head = link;
				this.setTail();
			}
			this.size++;
		}
	}

	setTail(){
		if (this.size === this.limit) {
			let newtail = this.tail.prev;
			newtail.next = null; 
			this.tail.prev = null;
			this.size--;
			this.tail = newtail
		}
	}

	printCache(){
		let link = this.head;
		let cache = []
		while (link) {
			cache.push(link.val);
			link = link.next;
		}
		return cache;
	}
}

const implementLRUCache = (arr, limit) => {
	let lruCache = new LRUCache(limit);
	arr.forEach( val => lruCache.append(val));
	return lruCache.printCache();
}