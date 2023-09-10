struct Array[T: AnyType]:
    var storage: Pointer[T]
    var size: Int
    var capacity: Int

    fn __init__[*Ts: AnyType](inout self, owned data: ListLiteral[Ts]):
        self.size = len(data)
        self.capacity = self.size
        self.storage = Pointer[T].alloc(self.capacity)
        let src = Pointer.address_of(data).bitcast[T]()
        for i in range(len(data)):
            self.storage.store(i, src.load(i))
    
    fn __getitem__(inout self, index: Int) -> T:
        return self.storage.load(index)

    fn __setitem__(inout self, i: Int, value: T):
        self.storage.store(i, value)

    fn __iter__(self) -> ListIterator[T]:
        return ListIterator[T](self.storage, self.size)
    
    fn len(self) -> Int:
        return self.size

    fn resize(inout self, by: Int):
        let new_capacity = by
        let new = Pointer[T].alloc(new_capacity)
        for i in range(self.size):
            new.store(i, self.storage.load(i))
        self.storage = new
        self.capacity = new_capacity
    
    fn append(inout self, value: T):
        if self.size >= self.capacity:
            self.resize(self.capacity * 2)
        self.storage.store(self.size, value)
        self.size += 1
    
    fn extend(inout self, array: Array[T]):
        for item in array: self.append(item)
    
    fn clear(inout self):
        self.size = 0
        self.resize(0)
    
    fn reverse(inout self):
        var left: Int = 0
        var right: Int = self.size - 1
        let temp: T
        while left <= right:
            temp = self.storage.load(left)
            self.storage.store(left, self.storage.load(right))
            self.storage.store(right, temp)
            left += 1
            right -= 1

    fn remove(inout self, index: Int):
        for i in range(index, self.size):
            self.storage.store(i, self.storage.load(i+1))
        self.size -= 1

    fn pop(inout self, index: Int) -> T:
        let data = self.storage.load(index)
        self.remove(index)
        return data

    fn swap(inout self, index1: Int, index2: Int):
        let temp: T
        temp = self.storage.load(index1)
        self.storage.store(index1, self.storage.load(index2))
        self.storage.store(index2, temp)

struct ListIterator[T: AnyType]:
    var offset: Int
    var max: Int
    var storage: Pointer[T]
    
    fn __init__(inout self, storage: Pointer[T], max: Int):
        self.offset = 0
        self.max = max
        self.storage = storage
    
    fn __len__(self) -> Int:
        return self.max - self.offset
    
    fn __next__(inout self) -> T:
        let ret = self.storage.load(self.offset)
        self.offset += 1
        return ret
""" example on creation
def main():
    var arr = Array[Int]([1, 2, 3])"""
    
