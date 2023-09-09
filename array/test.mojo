from array import Array
from python import Python

def main():
    random = Python.import_module("random")
    arr = Array[Float64](1, 1)
    for i in range(20):
        var x = random.randint(1, 10).to_float64()
        arr.append(x)
    for i in arr:
        print(i)
