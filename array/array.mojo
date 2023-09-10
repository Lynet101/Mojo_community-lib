struct Array[T: AnyType]:
    var size: Int
    var capacity: Int
    var data: Pointer[T]

    fn __init__(inout self, size: Int, value: T):
        self.capacity = size * 2
        self.size = size
        self.data = Pointer[T].alloc(self.capacity)
        for i in range(self.size):
            self.data.store(i, value)

    fn __getitem__(self, i: Int) -> T:
        return self.data.load(i)

    fn __setitem__(inout self, i: Int, value: T):
        self.data.store(i, value)

    fn __iter__(self) -> ArrayIterator[T]:
        return ArrayIterator[T](self.data, self.size)

    fn resize(inout self, new_capacity: Int):
        let new = Pointer[T].alloc(new_capacity)
        for i in range(self.size - 1):
            new.store(i, self.data.load(i))
        self.data = new
        self.capacity = new_capacity

    fn len(self) -> Int:
        return self.size

    fn append(inout self, value: T):
        if self.size == self.capacity:
            self.resize(self.capacity * 2)
        self.data.store(self.size, value)
        self.size += 1

    fn clear(inout self):
        self.size = 0
        self.capacity = 0
        self.data = Pointer[T].alloc(self.capacity)

    """fn remove(inout self, index: Int):
        self.pop(index)

    fn pop(inout self, index: Int) -> T:
        var item = self.data.load(index)
        for i in range(index, self.size):
            self.data.store(i-1, self.data.load(i))
        self.size -= 1

        if 0 < self.size < self.capacity // 2:
            self.resize(self.capacity // 2)
        return item"""

    fn insert(inout self, index: Int, value: T):
        if index < 0 or index > self.size:
            return
        if self.size == self.capacity:
            self.resize(2 * self.capacity)
        for i in range(self.size, index, -1):
            self.data.store(i, self.data.load(i-1))
        self.data.store(index, value)
        self.size += 1

    fn swap(inout self, index1: Int, index2: Int):
        var temp = self.data.load(index1)
        self.data.store(index1, self.data.load(index2))
        self.data.store(index2, temp)

    fn reverse(inout self):
        var left = 0
        var right = self.size - 1
        while left <= right:
            self.swap(left, right)
            left += 1
            right -= 1

    def extend(inout self, second_list: Array[T]):
        for i in second_list:
            self.append(i)

    """fn copy(inout self) -> Array[T]:
        var new = Array[T]
        new.capacity = self.capacity
        for i in range(self.size):
            new.append(self.data.load(i))
        return new"""

    """fn count(inout self, value: T) -> Int:
        var count: Int = 0
        for i in range(self.size - 1):
            if self.data.load(i) == value:
                count += 1
        return count"""

    """fn index(inout self, value: T) -> Int:
        for i in range(self.size -1)
            if self.data.load(i) == value:
                return i
        return -1"""


struct ArrayIterator[T: AnyType]:
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
    
def main():
    arr = Array[Int](2, 3)
    arr2 = Array[Int](3, 4)
    for i in arr:
        print(i)
    arr.extend(arr2)
    for i in arr:
        print(i)



