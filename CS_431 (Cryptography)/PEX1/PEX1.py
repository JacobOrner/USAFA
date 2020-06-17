import easygui
import timeit
import random
import copy
import os

def main():
    choice = 1
    print("Welcome to the Factoring Factory\n")
    while choice != 0:
        number = easygui.integerbox("Enter the integer you would like to have factored", "Factoring Factory", "", 1, 2**31)
        print("Welcome to the Factoring Factory\n")
        print("Now factoring: ", number)

        print("\n\nBrute force factoring")
        start = timeit.timeit()
        print("Found a factor = ", bruteForce(number))
        end = timeit.timeit()
        print("It took {:.8f} seconds\n".format(abs(start-end)))

        print("Pollard Rho")
        start = timeit.timeit()
        print("Found a factor = ", pollardRho(number))
        end = timeit.timeit()
        print("It took {:.8f} seconds\n".format(abs(start-end)))

        print("Dixon's Algorithm")
        factor_base_size = easygui.integerbox("Enter # of factors in factor base: ", "Factoring Factory", "", 1, 25)
        print("Factor base: ", factor_base_size)
        start = timeit.timeit()
        print("Found a factor = ", dixons_algorithm(number, factor_base_size))
        end = timeit.timeit()
        print("It took {:.8f} seconds\n\n\n".format(abs(start-end)))
        choice = easygui.boolbox("Would you like to factor another number?", "Factoring Factory", ["yes","no"])


def dixons_algorithm(number, factor_base_size):
    factor = 2
    factor_base = []
    factor_vectors = []
    for i in range(factor_base_size):
        factor_vectors.append(0)
    true_x = []
    for i in range(factor_base_size):
        true_x.append(0)
    C = []
    num_equations = 0
    chances = 3

    # Establish the factor base
    while len(factor_base) < factor_base_size:
        if is_prime(factor):
            factor_base.append(factor)
        factor += 1
    print("Done generating factor base.")

    while chances > 0:
        # Find possible C
        while num_equations != factor_base_size:
            for i in range(factor_base_size):
                factor_vectors[i] = 0

            x = random.randint(int(number ** .5 + 1), number)
            true_x[num_equations] = x
            x = x ** 2 % number
            while x == 1:
                x = random.randint(int(number**.5 + 1), number)
                print(num_equations, x)
                true_x[num_equations] = x
                x = x**2 % number
            valid = True
            found = False
            test = x
            while valid and not found:
                test_change = test
                i = 0
                while i < len(factor_base):
                    if test % factor_base[i] == 0:
                        factor_vectors[i] += 1
                        test //= factor_base[i]
                        i = len(factor_base)
                    else:
                        i += 1
                if test == 1:
                    C.append(factor_vectors[:])
                    print(num_equations, true_x[num_equations], "===", x, factor_vectors)
                    num_equations += 1
                    found = True
                if test_change == test:
                    valid = False

        I = []
        for i in range(factor_base_size):
            row = []
            for j in range(factor_base_size):
                row.append(0)
                if i == j:
                    row[i] += 1
            I.append(row)

        C_prime = copy.deepcopy(C)

        for i in range(len(C_prime)):
            for j in range(len(C_prime[i])):
                C_prime[i][j] %= 2

        mod2GaussianElim(I, C_prime)

        # print(true_x)
        # print(C)
        # print(I)
        # print(C_prime)

        for i in range(len(C_prime)):
            zero_row = True
            for j in range(len(C_prime[i])):
                if C_prime[i][j] != 0:
                    zero_row = False
            if zero_row:
                # print(i)
                x = 1
                for k in range(factor_base_size):
                    if I[i][k] == 1:
                        x *= true_x[k]
                y = 1
                for k in range(factor_base_size):
                    if I[i][k] == 1:
                        for j in range(factor_base_size):
                            y *= factor_base[j] ** C[k][j]
                x %= number
                y = int(y**.5) % number
                # if x % number != y and -x % number != y:
                if gcd(abs(x-y),number) != 1 and gcd(abs(x-y),number) != number:
                    return gcd(abs(x-y),number)
        chances -= 1

    return "No Factor Found"


def pollardRho(number):
    count = int(number ** .5) + 1

    a = random.randint(2, number-1)
    b = random.randint(2, number-1)
    f = 1

    while f == 1:
        if count == 0:
            count = int(number ** .5) + 1
            a = random.randint(2, number - 1)
            b = random.randint(2, number - 1)
        a = (a**2 + 1) % number
        b = (b**2 + 1) % number
        f = gcd(abs(a-b), number)
        if f != 1 and f != number:
            return f
        count -= 1


def bruteForce(number):
    for i in range(2, number):
        if number % i == 0:
            return i


def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    return True


def mod2GaussianElim(identMat,gaussMat):
    for col in range(0,len(identMat)):
        if gaussMat[col][col] == 0:
           for row in range(col+1,len(identMat)):
               if gaussMat[row][col] == 1:
                   for k in range(0,len(identMat)):
                       tmp = gaussMat[row][k]
                       gaussMat[row][k] = gaussMat[col][k]
                       gaussMat[col][k] = tmp
                   for k in range(0,len(identMat)):
                      tmp = identMat[row][k]
                      identMat[row][k] = identMat[col][k]
                      identMat[col][k] = tmp
                   break
        if gaussMat[col][col] == 1:
            for row in range(col+1,len(identMat)):
                if gaussMat[row][col] == 1:
                    for k in range(0,len(identMat)):
                        gaussMat[row][k] = (gaussMat[row][k]+gaussMat[col][k])%2
                    for k in range(0,len(identMat)):
                        identMat[row][k] = (identMat[row][k]+identMat[col][k])%2

if __name__ == "__main__":
    main()