import BinaryTree as bt

class HashTable:
	def __init__(self, size):
		self.size = size
		self.slots = [None for i in range(size)]
		self.count = 0
	
	def _hash(self, key):
		cont = 1
		valor = 0
		for c in key:
			valor = valor + (ord(c) * cont)
			cont = cont + 1
		return valor % self.size
		
	def put(self, key, value):
		hashValue = self._hash(key)
		position = hashValue
		if self.slots[position] == None:
			self.slots[position] = bt.BinaryTree(key, value)
		else:
			self.slots[position].put(key, value)

	
		
	def get(self, key):
		return None
		
	def __setitem__(self, key, value):
		self.put(key, value)
	
	def __getitem__(self, key):
		return self.get(key)
		
		






































