from random import randint as ri

def prepare():
    arr = [ri(0, 100) for _ in range(1000)]
    return arr


def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)


def main():
    arr = prepare()
    arr = quicksort(arr)
    print(arr)

main()