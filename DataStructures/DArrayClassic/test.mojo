from DArray import Array

fn test_append():
    let list: Array[Int] = [1, 2, 3, 4]
    let list2: Array[Int] = list.copy()    
    
    for item in list: print(item)
    for item in list2: print(item)

fn main():
    test_append()