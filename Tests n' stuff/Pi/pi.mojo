fn calculate_pi(terms: Int) -> Float64:
    var pi: Float64 = 0
    var temp: Float64 = 0
    for i in range(terms):
        temp = ((-1) ** i) / (2 * i + 1)
        pi += temp
    pi *= 4
    return pi

fn main():
    print(calculate_pi(100000000))