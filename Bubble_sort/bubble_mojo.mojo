from memory.unsafe import Pointer

def main():
    n = 10
    var mylist = [9,8,7,6,5,4,3,2,1,0]
    let arr = Pointer.address_of(mylist).bitcast[Int]()

    #bubblesort
    print(mylist)
    temp = 0
    for i in range(n):
        for j in range(n-i-1):
            if arr[j] > arr[j+1]:
                temp = arr[j]
                arr.store(j, arr[j+1])
                arr.store(j+1, temp)
    print(mylist)
