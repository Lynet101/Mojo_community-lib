class Test():
    def __init__(self):
        self.arr = DynamicArray()
        self.append_test()
        print([i for i in self.arr])
        self.main()

    def main(self):
        self.reverse_test()
        self.sort_test()

    def sort_test(self):
        self.arr.sort()
        print([i for i in self.arr])

    def copy_test(self):
        self.arr2 = self.arr.copy()

    def reverse_test(self):
        self.arr.reverse()
        print([i for i in self.arr])

    def insert_test(self):
        self.arr.insert(1, 7)
        print([i for i in self.arr])

    def remove_test(self):
        self.arr.remove(2)
        print([i for i in self.arr])

    def pop_test(self):
        print(self.arr.pop())
        print([i for i in self.arr])
        print(self.arr.pop(2))
        print([i for i in self.arr])
        print(self.arr.pop())
        print([i for i in self.arr])

    def append_test(self):
        self.arr.append(1)
        self.arr.append(2)
        self.arr.append(3)
        self.arr.append(2)

    def index_test(self):
        print(self.arr.index(2))

    def count_test(self):
        print(self.arr.count(2))

    def extend_test(self):
        self.arr2 = DynamicArray()
        self.arr2.append(1)
        self.arr2.append(2)
        self.arr2.append(3)
        self.arr2.append(2)
        self.arr.extend(arr2)
        print([i for i in self.arr])

    def len_test(self):
        print(len(self.arr))

    def clear_test(self):
        self.arr.clear()
        print([i for i in self.arr])

Test()