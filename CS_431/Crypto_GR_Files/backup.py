import string
import math


ALPHABET = string.ascii_lowercase


def notes():
    return "Perfect secrecy is when H(P|C) = H(P).\n" \
           "The joint entropy of two events is maximized when\n" \
           "those events are independent, and can never exceed\n" \
           "the sum of the individual entropies.\n" \
           "Kerckhoff's principle- you cannot rely on security thourgh\n" \
           "obscurity. The means of encryption are not secret.\n" \
           "Joint probability: P(E1, E2) = P(E1) * P(E2) if and only if\n" \
           "the events are independent.\n" \
           "Conditional Probability: P(E1) given that E2 happened.\n" \
           "P(E1 | E2) = P(E1, E2) / P(E2)\n" \
           "Entropy: H(x) = -sum(Pi * log(Pi))\n" \
           "Joint Entropy: H(x, y) = -sum(P(X=x | Y=y) * log(P(X=x | Y=y)))\n" \
           "Conditional Entropy: see notes"


def get_common(a, b):
    result = []
    for thing in a:
        if thing in b:
            result.append(thing)
    return result


def gauss(equations):
    max_num = 1
    for thing in equations:
        max_num *= thing[2]
    possibilities = almost_modular_inverse(equations[0][0], equations[0][1], equations[0][2], max_num)
    for thing in equations:
        current = almost_modular_inverse(thing[0], thing[1], thing[2], max_num)
        possibilities = get_common(possibilities, current)
    return possibilities


def almost_modular_inverse(a, remainder, mod, limit=0):
    if limit == 0:
        limit = mod
    possibilities = []
    for i in range(limit):
        if a * i % mod == remainder:
            possibilities.append(i)
    return possibilities


def almost_modular_inverse_squared(remainder, mod, a=1):
    possibilities = []
    for i in range(mod):
        if a * pow(i, 2) % mod == remainder:
            possibilities.append(i)
    return possibilities


def probable_key_vignere(m, key_len):
    results = []
    for i in range(key_len):
        for letter in ALPHABET:
            current = ""
            for x in range(i, len(m), key_len):
                current += decrypt_vignere(m[x].lower(), letter)
            results.append((letter, i, current))
    return results


def probable_shift_vignere(m, l=0):
    if l > 0:
        limit = l
    else:
        limit = len(m)
    mtest = m
    shift = 0
    highest = 0
    result = -1
    while len(mtest) > 0 and shift < limit:
        mtest = mtest[1:]
        shift += 1
        count = 0
        for i in range(len(mtest)):
            if m[i] == mtest[i]:
                count += 1
        if count > highest:
            highest = count
            result = shift
    return result


def encrypt_caesar(m, s):
    encrypted = ""
    for char in m.lower():
        if char in ALPHABET:
            encrypted += ALPHABET[(ALPHABET.index(char) + s) % len(ALPHABET)]
        else:
            encrypted += char
    return encrypted


def decrypt_caesar(m, s):
    return encrypt_caesar(m, len(ALPHABET) - s)


def all_caesar(m):
    possible = []
    for i in range(len(ALPHABET)):
        possible.append(encrypt_caesar(m, i))
    return possible


def encrypt_affine(m, a, b):
    encrypted = ""
    for char in m.lower():
        if char in ALPHABET:
            encrypted += ALPHABET[(a * (ALPHABET.index(char)) + b) % len(ALPHABET)]
        else:
            encrypted += char
    return encrypted


def decrypt_affine(m, a, b):
    decrypted = ""
    limit = pow(len(ALPHABET), 2) + 122
    for char in m.lower():
        if char in ALPHABET:
            i = ALPHABET.index(char) - b
            while i < 0:
                i += len(ALPHABET)
            while i % a != 0 and i < limit:
                i += len(ALPHABET)
            i //= a
            decrypted += ALPHABET[i]
        else:
            decrypted += char
    return decrypted


def encrypt_vignere(m, k):
    encrypted = ""
    for i in range(len(m)):
        if m[i].lower() in ALPHABET:
            encrypted += encrypt_caesar(m[i].lower(), ALPHABET.index(k[i % len(k)].lower()))
        else:
            encrypted += m[i]
    return encrypted


def decrypt_vignere(m, k):
    decrypted = ""
    for i in range(len(m)):
        if m[i].lower() in ALPHABET:
            decrypted += decrypt_caesar(m[i], ALPHABET.index(k[i % len(k)].lower()))
        else:
            decrypted += m[i]
    return decrypted


def entropy(p):
    summer = 0
    parts = []
    for thing in p:
        ind = -1 * thing[1] * math.log(thing[1], 2)
        summer += ind
        parts.append((thing[0], ind))
    return summer, parts


def egcd(a, b):
    if a == 0:
        return b, 0, 1
    else:
        g, y, x = egcd(b % a, a)
        return g, x - (b // a) * y, y


def gcd(a, b):
    result = egcd(a, b)
    if result[2] < 0:
        new_result = (result[0], result[1], result[2] + b)
    else:
        new_result = result
    return "gcd: {} x: {} y: {}".format(new_result[0], new_result[1], new_result[2])


def e_modular_inverse(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        return "modular inverse does not exist"
    else:
        return x % m


def modular_inverse(a, m):
    return "multiplicative inverse: {}".format(e_modular_inverse(a, m))


def big_exponent(base, exp, mod):
    answer = 1
    while exp > 0:
        if exp % 2 == 0:
            base = (pow(base, 2)) % mod
            exp /= 2
        else:
            answer = (base * answer) % mod
            exp -= 1
    return answer

# examples
print(decrypt_caesar("bqqmf", 1))
print(encrypt_caesar("apple", 27))
print(all_caesar("bqqmf"))
print(encrypt_vignere("TESTMESSAGE", "balls"))
print(decrypt_vignere("UEDEEFSDLYF", "balls"))
print(entropy([("A", 0.5), ("B", 0.25), ("C", 0.25)]))
print(notes())
print(entropy([("A", 0.2), ("B", 0.3), ("C", 0.5)]))
print(entropy([("HH", 0.25), ("HT", 0.25), ("TH", 0.25), ("TT", 0.25)]))
print(entropy([("r", 6/10), ("g", 2/10), ("b", 2/10)]))
print(entropy([("r", 5/9), ("g", 2/9), ("b", 2/9)]))
print(gcd(19, 103))
# TODO: check if x and y are backwards and the positive y thing works
print(modular_inverse(60002, 411))
print(modular_inverse(13, 101))
print(modular_inverse(101, 13))
print(big_exponent(2, 12345, 789))
print(probable_shift_vignere("ABCBABBBAC"))
print(probable_shift_vignere("ABCBABBBAC", 3))
# TODO: Conditional Entropy
print(encrypt_affine("harry", 7, 3))
print(decrypt_affine("adssp", 7, 3))
#print(probable_key_vignere("ABCBABBAC", 2))
print(almost_modular_inverse(6, 11, 21))
print(almost_modular_inverse(15, 6, 27))
print(almost_modular_inverse_squared(11, 35))
print(gauss([(1, 3, 5), (1, 14, 17), (1, 7, 11)]))