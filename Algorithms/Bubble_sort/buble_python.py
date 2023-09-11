import random

def prepare(run):
    list = [random.randint(0, 1000) for i in range(run)]
    return list

def bsort(list, run):
    for i in range(0, len(list)):
        print((i/run)*100)
        for j in range(0, len(list) - i - 1):
            if list[j] > list[j + 1]:
                list[j], list[j + 1] = list[j + 1], list[j]
    return list

def main():
    run = 10000
    list = prepare(run)
    bsort(list, run)

if __name__ == '__main__':
    main()