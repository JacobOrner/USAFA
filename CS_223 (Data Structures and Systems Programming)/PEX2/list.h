typedef struct poly {
	int coefficient;
	int exponent;
	struct poly *next;
} *Poly; // Poly is a pointer to a struct list.

// add item to the linked list in sorted order
Poly insertTerm(Poly head, int coefficient, int exponent);

// Helper function which denies invalid strings from being processed in strToPolynomial.
Poly nonrecursiveString2Poly(Poly polynomial, char *stringPoly);

// Helper function which filters out NULL terms.
void nonrecursivepoly2string(Poly p, char *s);

//Adds two polynomials and returns the sum.
Poly addPolynomial(Poly p1, Poly p2);

//Subtacts polynomial b from polynomial a and returns the difference.
Poly subtractPolynomial(Poly p1, Poly p2);

//Multiplies two polynomials and returns the product.
Poly multiplyPolynomial(Poly p1, Poly p2);
