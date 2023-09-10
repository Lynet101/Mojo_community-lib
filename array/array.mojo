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
        return self.size½
    


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


def main():
    var arr = Array[Int]([1, 2, 3])