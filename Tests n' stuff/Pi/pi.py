def calculate_pi(terms):
    pi = 0
    for i in range(terms):
        term = ((-1) ** i) / (2 * i + 1)
        pi += term
    pi *= 4
    return pi

def main():
    print(calculate_pi(100000000))

if __name__ == "__main__":
    main()
