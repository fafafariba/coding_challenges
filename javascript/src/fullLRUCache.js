class Node {
	constructor(key, value){
		this.key = key;
		this.val = value;
		this.next = null;
		this.prev = null;
	}
}

class LRUCache {
	constructor(capacity = 3){
		this.capacity = capacity;
		this.cache = {};
		this.head = null;
		this.tail = null;
		this.size = 0;
	}

	set(key, value){

		if (this.cache[key]){
			this.update(key, value);
		} else {
			let node = new Node(key, value);
			this.cache[key] = node;
			this.resetHead(node);
			if (!this.tail) this.setTail(node);
			this.size++;
			this.checkCapacity();
		}
	}

	resetHead(node){
		if (this.head) {
			this.head.prev = node;
			node.next = this.head;
		} 
		this.head = node;
	}

	setTail(newNode){
		this.tail = newNode;
	}

	checkCapacity(){
		if (this.size > this.capacity) {
			this.remove(this.tail);
		}
	}

	get(key){
		let node = this.cache[key];
		if (!node) return "Error: Item does not exist";
		this.remove(node);
		this.set(node.key, node.val);
		return node.val;
	}

	remove(node){
		let prevNode = node.prev;
		let nextNode = node.next;
		if (node === this.tail) {
			node.prev = null;
			prevNode.next = null;
			this.tail = prevNode;
		} else if (node === this.head) {
			node.next = null;
			nextNode.prev = null;
			this.head = nextNode;
		} else {
			node.next = null;
			node.prev = null;
			prevNode.next = nextNode;
			nextNode.prev = prevNode;
		}
		delete this.cache[node.key];
		this.size--;
	}

	update(key, value){
		let node = this.cache[key];
		if (!node) return "Error: Item does not exist";
		this.remove(node);
		this.set(key, value);
		return this.cache[key].val;
	}

	returnCache(){
		let cache = {};
		for(key in this.cache){
			cache[key] = this.cache[key].val;
		}
		return cache;
	}
}

const implementLRUCache = (obj, size) => {
	let lruCache = new LRUCache(size);
	for(key in obj){
		lruCache.set(key, obj[key]);
	}
	return lruCache;
}
