import array

def quicksort(arr):
    if arr.len() <= 1:
        return arr
    let pivot = arr[arr.len() // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)

def main():
    arr = array.Array[Int]([7, 6, 5, 4, 3, 2, 1])
    print(quicksort(arr))