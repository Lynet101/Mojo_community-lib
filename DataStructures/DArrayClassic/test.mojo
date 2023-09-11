from array import Array

fn test_append():
    var list: Array[Int] = [1, 2, 3, 4]
    
    list.append(5)
    list.extend([2, 2, 2])
    
    for item in list: print(item)
    # outputs 1 2 3 4 5 2 2 2

fn main():
    test_append()