p = 5021
q = 25013
d = 107623063
n = 125590273
a = []
b = [ 120, 2010, 311, 120, 401, 2314]
c = [ 114221617, 45447136, 43143276, 114221617, 92995906, 71779350 ]

for c_t in c:
    result = c_t
    for i in range( d - 1 ):
        result = (result * c_t ) % p
    a.append( result )
    print(result)

for b_t in b:
    result = b_t
    for i in range(6):
        result *= b_t
    print(result % n)
