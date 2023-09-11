class DynamicArray:
    def __init__(self): #implemented
        self.size = 0
        self.capacity = 1
        self.array = self.make_array(self.capacity)

    def __len__(self): #implemented
        return self.size

    def append(self, item): #implemented
        if self.size == self.capacity:
            self._resize(2 * self.capacity)
        self.array[self.size] = item
        self.size += 1

    def _resize(self, new_capacity): #implemented
        new_array = self.make_array(new_capacity)
        for i in range(self.size):
            new_array[i] = self.array[i]
        self.array = new_array
        self.capacity = new_capacity

    def make_array(self, new_capacity): #implemented
        return [None] * new_capacity

    def __getitem__(self, index): #implemented
        return self.array[index]

    def clear(self): #implemented
        self.size = 0
        self.capacity = 1
        self.array = self.make_array(self.capacity)
 
    def count(self, item): #later
        count = 0
        for i in range(self.size):
            if self.array[i] == item:
                count += 1
        return count

    def extend(self, other): #later
        for i in range(other.size):
            self.append(other.array[i])

    def index(self, item): #later
        for i in range(self.size):
            if self.array[i] == item:
                return i
        return -1

    def remove(self, item):  #not functioning
        i = self.index(item)
        if i == -1:
            raise ValueError("item not in array")
            return
        self.pop(i)

    def pop(self, index=None): #not functioning
        if self.size == 0:
            raise IndexError("pop from empty array")
        if index is None:
            index = self.size - 1
        item = self.array[index]
        # Shift elements to fill the gap
        for i in range(index, self.size - 1):
            self.array[i] = self.array[i + 1]
        # Clear the last slot
        self.array[self.size - 1] = None
        self.size -= 1
        # Shrink the array if it's less than a quarter full
        if 0 < self.size < self.capacity // 4:
            self._resize(self.capacity // 2)
        return item
    
    def insert(self, index, item): #Implemented
        if index < 0 or index > self.size:
            raise IndexError("index out of range")
        if self.size == self.capacity:
            self._resize(2 * self.capacity)
        # Shift elements to make space for the new item
        for i in range(self.size, index, -1):
            self.array[i] = self.array[i - 1]
        self.array[index] = item
        self.size += 1

    def reverse(self): #implemented
        left = 0
        right = self.size - 1
        while left < right:
            self.array[left], self.array[right] = self.array[right], self.array[left]
            left += 1
            right -= 1

    def copy(self): #later
        new_array = DynamicArray()
        for item in self:
            new_array.append(item)
        return new_array

    def sort(self): #later
        self._quicksort(0, self.size - 1)

    def _quicksort(self, low, high):
        if low < high:
            pivot_index = self._partition(low, high)
            self._quicksort(low, pivot_index - 1)
            self._quicksort(pivot_index + 1, high)

    def _partition(self, low, high): 
        pivot = self.array[high]
        i = low - 1
        for j in range(low, high):
            if self.array[j] <= pivot:
                i += 1
                self.array[i], self.array[j] = self.array[j], self.array[i]
        self.array[i + 1], self.array[high] = self.array[high], self.array[i + 1]
        return i + 1

    def swap(self, index1, index2): #implemented
        self.array[index1], self.array[index2] = self.array[index2], self.array[index1]

    def __getitem__(self, index): #implemented
        if index < 0 or index >= self.size:
            raise IndexError("index out of range")
        return self.array[index]

    def __setitem__(self, index, item): #implemented
        if index < 0 or index >= self.size:
            raise IndexError("index out of range")
        self.array[index] = item

    def __iter__(self): #implemented
        self.indexe = 0
        return self

    def __next__(self): #implemented
        if self.indexe >= self.size:
            raise StopIteration
        item = self.array[self.indexe]
        self.indexe += 1
        return item
    
    def __enumerate__(self):
        return zip(range(self.size), self.array[:self.size])