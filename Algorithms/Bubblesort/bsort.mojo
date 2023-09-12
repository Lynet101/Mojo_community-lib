#to use with arrays created from DArray.classic

def sort(list: T):
    for i in range(list.len()):
        for j in range(list.len() - i - 1):
            if list[j] > list[j+1]:
                list.swap(list[j], list[j+1])