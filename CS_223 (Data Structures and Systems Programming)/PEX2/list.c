/*
 * Preliminary Documentation Statement: Received help from C3C John Johnson regarding output of sprintf() and
 * how to print the string to the array *s in the method polyToString(). Received help from C3C Austin Gadient
 * regarding how to parse the pointer to stringPoly in the method strToPolynomial().
*/
/* Documentation Statement: Same as preliminary documentation statement. C3C Tunitis helped me to think through 
 * the error scenarios pertaining to invalid input. 
*/
#include "list.h"
#include <stdio.h>
#include <stdlib.h>

#define MIN_TERM_LENGTH 6
#define MAX_TERM_LENGTH 16
#define MAX_POLY_LENGTH 128

// Convert a string to a polynomial in the list.
Poly strToPolynomial(Poly polynomial, char *stringPoly);

// Convert a polynomial to a string, assign the string to s.
void polyToString(Poly p, char *s, int total_length);

//Helper function to multiply a term of the first polynomial with the entirety of the second polynomial.
Poly multiply(Poly p1, Poly p2);

//Inserts a term into the polynomial head given a coefficient and an exponent. Places the terms in descending order of exponents.
Poly insertTerm(Poly head, int coefficient, int exponent){
	Poly temp;
	// I can solve at least one small problem
	//Zero items in list
	if (head == NULL) {
		temp = malloc(sizeof(struct poly)); // Creates memory for a term.
		temp -> coefficient = coefficient; // Instantiates the coefficient.
		temp -> exponent = exponent; // Instantiates the exponent.
		temp -> next = NULL;
		return temp;
	}
	//Inserting before first item in list
	else if (exponent > head -> exponent) {
		temp = malloc(sizeof(struct poly));
		temp -> coefficient = coefficient;
		temp -> exponent = exponent;
		temp -> next = head;
		return temp;
	}
	else if (exponent == head -> exponent) {
		temp = malloc(sizeof(struct poly));
		if(coefficient + head-> coefficient == 0){			
			head = head -> next;
			return head;
		}
		else{
			temp -> coefficient = coefficient + head -> coefficient;
			temp -> exponent = exponent;
			temp -> next = head -> next;
			return temp;
		}
	}
	// If I can solve a slightly smaller problem I can solve this one.
	else {
		temp = insertTerm(head -> next, coefficient, exponent);
		head -> next = temp; 
		// new beginning of list is old beginning of list
		return head;
	}
}

// Checks for errors in input before calling recursive function.
Poly nonrecursiveString2Poly(Poly polynomial, char *stringPoly){
	//Checks input string for errors.
	if(stringPoly == NULL){
		printf("null");
		polynomial = NULL;
		return polynomial;
	}
	if(stringPoly[0] != '+'){
		printf("missing");
		sprintf(stringPoly, "ERROR: INVALID POLYNOMIAL - MISSING '+' CHARACTER");
		polynomial = NULL;
		return polynomial;
	}
	if(strlen(stringPoly) < MIN_TERM_LENGTH){
		printf("short");
		sprintf(stringPoly, "ERROR: POLYNOMIAL TOO SHORT");
		polynomial = NULL;	
		return polynomial;
	}
	if(strlen(stringPoly) > MAX_POLY_LENGTH){
		sprintf(stringPoly, "ERROR: POLYNOMIAL TOO LONG");
		polynomial = NULL;
		return polynomial;
	}
	if(stringPoly[1] == 0 && strlen(stringPoly) < 10){
		sprintf(stringPoly, "0");
		polynomial = NULL;
		return polynomial;
	}
	return strToPolynomial(polynomial, stringPoly); // If no errors, calls recursive function
}

// Recursively instantiates a polynomial given input.
Poly strToPolynomial(Poly polynomial, char *stringPoly){
	if(stringPoly == NULL){
		return polynomial;
	}
	
	char plus = NULL;
	int coefficient;
	char variable = '0';
	char carrot = NULL;
	int exponent = -2147483648;
	
	int count = 0;
	count = sscanf(stringPoly, "%c%d%c%c%d", &plus, &coefficient, &variable, &carrot, &exponent); // Scans a term from the input string.
	
	if(coefficient != 0 || coefficient != NULL){ // If the coefficient is 0, the term is not created.
		if(variable != 'x'){
			sprintf(stringPoly, "ERROR: INVALID VARIABLE, ONLY VARIABLE 'x' ACCEPTED");
		}
		else if(carrot != '^'){
			sprintf(stringPoly, "ERROR: MISSING EXPONENT MARKER");
		}
		else if(exponent == -2147483648){
			sprintf(stringPoly, "ERROR: ENTER NUMERICAL EXPONENT");
		}
		else{
			polynomial = insertTerm(polynomial, coefficient, exponent);
		}
	}
	else{
		return polynomial;
	}

	char* next = strchr(&stringPoly[1], '+'); // Parses the string.
	strToPolynomial(polynomial, next); // Recursively calls the function.
}

// Checks for an invalid polynomial before calling the recursive function.
void nonrecursivepoly2string(Poly p, char *s){
	if(p == NULL){
		sprintf(s, "0");
	}
	else{
		polyToString(p, s, 0);
	}
}

// Recursively instantiates a string given a polynomial input.
void polyToString(Poly p, char *s, int total_length){
	int len = 0;
	if(p == NULL){
		s[0] = '\0'; // Adds a NULL byte to the end of the string.
		return;
	}	
	if(total_length < 128){
		len = sprintf(s, "+%dx^%d", p->coefficient, p->exponent); // Adds the term to the string pointer.
		total_length += len;
		polyToString(p -> next, s+len, total_length); // Recursively calls the function.
	}
	else{
		sprintf(s-total_length, "ERROR: POLYNOMIAL LENGTH TOO LONG");
	}
}

Poly addPolynomial(Poly p1, Poly p2){
	// base case
	if(p1 == NULL && p2 == NULL){
		return 0;
	}
	// if p1 is 0, returns p2
	else if(p1 == NULL){
		return p2;
	}
	// if p2 is 0, returns p1
	else if(p2 == NULL){
		return p1;
	}
	// adds the highest exponent to the new polynomial
	else if(p1->exponent > p2->exponent){
		Poly temp = malloc(sizeof(struct poly));
		temp->coefficient = p1->coefficient;
		temp->exponent = p1->exponent;
		temp-> next = addPolynomial(p1->next, p2);
		return temp;
	}
	else if(p1->exponent < p2->exponent){
		Poly temp = malloc(sizeof(struct poly));
		temp->coefficient = p2->coefficient;
		temp->exponent = p2->exponent;
		temp -> next = addPolynomial(p1, p2->next);
		return temp;
	}
	// if the polynomial exponents are equal, add the coefficients and insert
	else if(p1->exponent == p2->exponent){
		Poly temp = malloc(sizeof(struct poly));
		if((p1->coefficient + p2->coefficient) == 0){
			temp = addPolynomial(p1->next, p2->next);
		}
		else{
			temp->coefficient = p1->coefficient + p2->coefficient;		
			temp->exponent = p1->exponent;
			temp->next = addPolynomial(p1->next, p2->next);
		}
		return temp;
	}
}

Poly subtractPolynomial(Poly p1, Poly p2){
	// base case. If p1 and p2 are 0, return 0.
	if(p1 == NULL && p2 == NULL){
		return 0;
	}
	// if p1 is null, return negative p2
	else if(p1 == NULL){
		Poly temp = malloc(sizeof(struct poly));
		temp->coefficient = -p2->coefficient;
		temp->exponent = p2->exponent;
		temp-> next = subtractPolynomial(p1, p2->next);
		return temp;
	}
	// if p2 is null, return p1
	else if(p2 == NULL){
		Poly temp = malloc(sizeof(struct poly));
		temp->coefficient = p1->coefficient;
		temp->exponent = p1->exponent;
		temp-> next = subtractPolynomial(p1->next, p2);
		return temp;
	}
	// subtract the highest exponent
	else if(p1->exponent > p2->exponent){
		Poly temp = malloc(sizeof(struct poly));
		temp->coefficient = p1->coefficient;
		temp->exponent = p1->exponent;
		temp-> next = subtractPolynomial(p1->next, p2);
		return temp;
	}
	else if(p1->exponent < p2->exponent){
		Poly temp = malloc(sizeof(struct poly));
		temp->coefficient = -p2->coefficient;
		temp->exponent = p2->exponent;
		temp -> next = subtractPolynomial(p1, p2->next);
		return temp;
	}
	// if the exponents are equal, subtract p2 from p1 and add term.
	else if(p1->exponent == p2->exponent){
		Poly temp = malloc(sizeof(struct poly));
		if((p1->coefficient - p2->coefficient) == 0){
			temp = subtractPolynomial(p1->next, p2->next);
		}
		else{
			temp->coefficient = p1->coefficient - p2->coefficient;	
			temp->exponent = p1->exponent;
			temp->next = subtractPolynomial(p1->next, p2->next);
		}
		return temp;
	}
}

// multiplies two polynomials. Uses a helper function to parse through multiplication process
Poly multiplyPolynomial(Poly p1, Poly p2){
	// base case. if p1 or p2 are null, return 0.
	if(p1 == NULL || p2 == NULL){
		return 0;
	}
	
	Poly temp = malloc(sizeof(struct poly));
	//adds the result of first term of p1 times all of p2 to the poly temp and recursively calls the rest of p1 times p2.
	temp = addPolynomial(multiply(p1, p2), multiplyPolynomial(p1->next, p2));
	return temp;
}

// multiplies one term through the second polynomial and returns the result.
Poly multiply(Poly p1, Poly p2){
	// base case. if p1 or p2 are null, return 0.
	if(p1 == NULL || p2 == NULL){
		return 0;
	}
	Poly temp = malloc(sizeof(struct poly));
	temp->coefficient = p1->coefficient * p2->coefficient;
	temp->exponent = p1->exponent + p2->exponent;
	temp->next = multiply(p1, p2->next);
	return temp;
}