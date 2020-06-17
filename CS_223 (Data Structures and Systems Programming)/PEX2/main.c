#include <stdio.h>  
#include <string.h>
#include "list.h"

int testAdd();
int testSubtract();
int testMultiply();
	
int main(int argc, char **argv)
{
	FILE *results;
	results = fopen("results.txt", "w");
	
	testAdd(results);
	testSubtract(results);
	testMultiply(results);
	
	text_menu();
	
	fclose(results);
	return 0;
}

void text_menu(){
	char response = 'Y';
	while(response != 'q'){		
		Poly polyA = NULL;
		Poly polyB = NULL;
		char stringA[128];
		char stringB[128];
		int validA = 0;
		int validB = 0;
		
		// requests the first polynomial
		printf("Polynomial #1 please\n");
		fgets(stringA, "%s", stdin);
		fflush(stdin);
		polyA = nonrecursiveString2Poly(polyA, stringA);
		
		if(stringA[0] == 'E'){
			validA = 1;
		}
		
		// if the input is invalid, continues asking until the input is valid.
		while(validA == 1){
			printf("%s\n",stringA);
			printf("Please give me a polynomial\n");
			fgets(stringA, "%s", stdin);
			fflush(stdin);
			polyA = nonrecursiveString2Poly(polyA, stringA);
			if(stringA[0] != 'E'){
				validA = 0;
			}
		}
		
		nonrecursivepoly2string(polyA, stringA);
		
		// requests the second polynomial
		printf("Polynomial #2 please\n");
		fgets(stringB, "%s", stdin);
		fflush(stdin);
		polyB = nonrecursiveString2Poly(polyB, stringB);
		
		if(stringB[0] == 'E'){
			validB = 1;
		}
		
		// if the second polynomial is invalid, continues asking until it is valid
		while(validB == 1){
			printf("\n%s\n", stringB);
			printf("Please give me a polynomial\n");
			fgets(stringB, "%s", stdin);
			fflush(stdin);
			polyB = nonrecursiveString2Poly(polyB, &stringB);
			if(stringB[0] != 'E'){
				validB = 0;
			}
		}
		
		nonrecursivepoly2string(polyB, stringB);
		
		Poly polySumAB = NULL;
		Poly polyDifferenceAB = NULL;
		Poly polyProductAB = NULL;
		
		char* sumAB[128];
		char* differenceAB[128];
		char* productAB[128];
	    
		// finds the sum, difference, and product of the two polynomials.
		polySumAB = addPolynomial(polyA, polyB);
		polyDifferenceAB = subtractPolynomial(polyA, polyB);
		polyProductAB = multiplyPolynomial(polyA, polyB);
		
		nonrecursivepoly2string(polySumAB, sumAB);
		nonrecursivepoly2string(polyDifferenceAB, differenceAB);
		nonrecursivepoly2string(polyProductAB, productAB);
		// prints the polynomials and mathematical results.
		printf("Polynomial A: %s\n", stringA);
		printf("Polynomial B: %s\n", stringB);
		printf("Sum of A and B: %s\n", sumAB);
		printf("Difference of A and B: %s\n", differenceAB);
		printf("Product of A and B: %s\n", productAB);
		
		printf("Would you like to play again? (q to quit)");
		scanf("%c", &response);
		fflush(stdin);
		printf("\n");
	}
}

int testAdd(FILE* results){
	char* resultA[100];
	Poly polyA = NULL;
	char* a = "+1x^0+1x^2+1x^3+1x^1"; // Tests out of order polynomial creation
	fprintf(results, "Polynomial A: %s\n", a);
	polyA = nonrecursiveString2Poly(polyA, a);
	nonrecursivepoly2string(polyA, resultA);
	if(strcmp("+1x^3+1x^2+1x^1+1x^0", resultA)){
		fprintf(results, "Polynomial A not parsed properly in addition unit test.\n");
		return 1;
	} // Checking resultA was created correctly
	
	char* resultB[100];
	Poly polyB = NULL;
	char* b = "+3x^0+2x^1+1x^2+0x^3"; // Tests a zero coefficient term
	fprintf(results, "Polynomial B: %s\n", b);
	polyB = nonrecursiveString2Poly(polyB, b);
	nonrecursivepoly2string(polyB, resultB);
	if(strcmp("+1x^2+2x^1+3x^0", resultB)){
		fprintf(results, "Polynomial B not parsed properly in addition unit test.\n");
		return 2;
	} // Checking resultB was created correctly and zero coefficient term was not stored
	
	char* resultC[100];
	Poly polyC = NULL;
	char* c = "+-4x^2+4x^1+-4x^4+4x^3+-4x^0";
	fprintf(results, "Polynomial C: %s\n", c);
	polyC = nonrecursiveString2Poly(polyC, c);
	nonrecursivepoly2string(polyC, resultC);
	if(strcmp("+-4x^4+4x^3+-4x^2+4x^1+-4x^0", resultC)){
		fprintf(results, "Polynomial C not parsed properly in addition unit test\n");
		return 3;
	} // Checking resultC was created correctly with negative coefficients
	
	char* resultAB[100];
	Poly polyAB = NULL;
	polyAB = addPolynomial(polyA,polyB);
	nonrecursivepoly2string(polyAB, resultAB);
	fprintf(results, "Addition with different coefficients (A+B): %s\n", resultAB);
	if(strcmp("+1x^3+2x^2+3x^1+4x^0", resultAB)){
		fprintf(results, "Addition of Polynomial A and Polynomial B incorrect in addition unit test.\n");
		return 4;
	} // a+b is correct, polynomials with different coefficients were added correctly
	
	char* resultAC[100];
	Poly polyAC = NULL;
	polyAC = addPolynomial(polyA,polyC);
	nonrecursivepoly2string(polyAC, resultAC);
	fprintf(results, "Addition with negative coefficients (A+C): %s\n", resultAC);
	if(strcmp("+-4x^4+5x^3+-3x^2+5x^1+-3x^0", resultAC)){
		fprintf(results, "Addition of Polynomial A and Polynomial C incorrect in addition unit test.\n");
		return 5;
	} // a+c is correct, polynomials with negative coefficients were added correctly

	char* resultBC[100];
	Poly polyBC = NULL;
	polyBC = addPolynomial(polyB, polyC);
	nonrecursivepoly2string(polyBC, resultBC);
	fprintf(results, "Addition with negative and absent coefficients (B+C): %s\n", resultBC);
	if(strcmp("+-4x^4+4x^3+-3x^2+6x^1+-1x^0", resultBC)){
		fprintf(results, "Addition of Polynomial B and Polynomial C incorrect in addition unit test.\n");
		return 6;
	} // b+c is correct, testing more addition with polynomials

 	char* resultABC[100];
	Poly polyABC = NULL;
	polyABC = addPolynomial(polyAB, polyC);
	nonrecursivepoly2string(polyABC, resultABC);
	fprintf(results, "Addition with negative, absent, and zero-sum coefficients (A+B+C): %s\n", resultABC);
	if(strcmp("+-4x^4+5x^3+-2x^2+7x^1", resultABC)){
		fprintf(results, "Addition of Polynomial A, Polynomial B, and Polynomial C incorrect in addition unit test.\n");
		return 7;
	} // a+b+c is correct, testing for addition of polynomials resulting in zero term coefficients
	
	fprintf(results, "All addition unit tests completed successfully.\n\n");
	return 0;
}

int testSubtract(FILE* results){
	char* resultA[100];
	Poly polyA = NULL;
	char* a = "+1x^0+1x^2+1x^3+1x^1";
	fprintf(results, "Polynomial A: %s\n", a);
	polyA = nonrecursiveString2Poly(polyA, a);
	nonrecursivepoly2string(polyA, resultA);
	if(strcmp("+1x^3+1x^2+1x^1+1x^0", resultA)){
		fprintf(results, "Polynomial A not parsed properly in subtraction unit test.\n");
		return 1;
	} // a did not change, testing correct creation of unordered coefficient input.
	
	char* resultB[100];
	Poly polyB = NULL;
	char* b = "+3x^0+2x^1+1x^2+0x^3";
	fprintf(results, "Polynomial B: %s\n", b);
	polyB = nonrecursiveString2Poly(polyB, b);
	nonrecursivepoly2string(polyB, resultB);
	if(strcmp("+1x^2+2x^1+3x^0", resultB)){
		fprintf(results, "Polynomial B not parsed properly in subtraction unit test.\n");
		return 2;
	} // b did not change, testing correct creation of unordered coefficient input.
	
	char* resultC[100];
	Poly polyC = NULL;
	char* c = "+-4x^2+4x^1+-4x^4+4x^3+-4x^0";
	fprintf(results, "Polynomial C: %s\n", c);
	polyC = nonrecursiveString2Poly(polyC, c);
	nonrecursivepoly2string(polyC, resultC);
	if(strcmp("+-4x^4+4x^3+-4x^2+4x^1+-4x^0", resultC)){
		fprintf(results, "Polynomial C not parsed properly in subtraction unit test.\n");
		return 3;
	} // c did not change, testing correct creation of negative coefficients.

	char* resultAB[100];
	Poly polyAB = NULL;
	polyAB = subtractPolynomial(polyA,polyB);
	nonrecursivepoly2string(polyAB, resultAB);
	fprintf(results, "Subtraction resulting in zero-sum coefficients (A-B): %s\n", resultAB);
	if(strcmp("+1x^3+-1x^1+-2x^0", resultAB)){
		fprintf(results, "Subtraction of Polynomial B from Polynomial A incorrect in subtraction unit test.\n");
		return 4;
	} // a - b is correct, test subtraction coefficients resulting in zero coefficients.
	
	char* resultAC[100];
	Poly polyAC = NULL;
	polyAC = subtractPolynomial(polyA,polyC);
	nonrecursivepoly2string(polyAC, resultAC);
	fprintf(results, "Subtraction with negative coefficients (A-C): %s\n", resultAC);
	if(strcmp("+4x^4+-3x^3+5x^2+-3x^1+5x^0", resultAC)){
		fprintf(results, "Subtraction of Polynomial C from Polynomial A incorrect in subtraction unit test.\n");
		return 5;
	} // a - c is correct, testing subtraction of negative coefficients.

	char* resultBC[100];
	Poly polyBC = NULL;
	polyBC = subtractPolynomial(polyB, polyC);
	nonrecursivepoly2string(polyBC, resultBC);
	fprintf(results, "Subtraction resulting in zero-sum coefficients and absent exponents (B-C): %s\n", resultBC);
	if(strcmp("+4x^4+-4x^3+5x^2+-2x^1+7x^0", resultBC)){
		fprintf(results, "Subtraction of Polynomial C from Polynomial B incorrect in subtraction unit test.\n");
		return 6;
	} // b - c is correct, testing subtraction of negative coefficients.

 	char* resultABC[100];
	Poly polyABC = NULL;
	polyABC = subtractPolynomial(polyAB, polyC);
	nonrecursivepoly2string(polyABC, resultABC);
	fprintf(results, "Subtraction resulting in negative and zero-sum coefficients and missing exponents (A-B-C): %s\n", resultAC);
	if(strcmp("+4x^4+-3x^3+4x^2+-5x^1+2x^0", resultABC)){
		fprintf(results, "Subtraction of Polynomial C from Polynomial B from polyniomal A incorrect in subtraction unit test.\n");
		return 7;
	} // a - b - c is correct, testing subtraction of polynomials with different coefficients 
	
	fprintf(results, "All subtraction units tests completed successfully.\n\n");
	return 0;
}

int testMultiply(FILE* results){
	char* resultA[100];
	Poly polyA = NULL;
	char* a = "+2x^1+2x^2+2x^0";
	polyA = nonrecursiveString2Poly(polyA, a);
	nonrecursivepoly2string(polyA, resultA);
	fprintf(results, "Polynomial A: %s\n", a);
	if(strcmp("+2x^2+2x^1+2x^0", resultA)){
		fprintf(results, "Polynomial A not parsed properly in subtraction unit test.\n");
		return 1;
	} // a did not change, testing creation of polynomials with unordered coefficients.
	
	char* resultB[100];
	Poly polyB = NULL;
	char* b = "+2x^0+2x^1+0x^2";
	polyB = nonrecursiveString2Poly(polyB, b);
	nonrecursivepoly2string(polyB, resultB);
	fprintf(results, "Polynomial B: %s\n", b);
	if(strcmp("+2x^1+2x^0", resultB)){
		fprintf(results, "Polynomial B not parsed properly in subtraction unit test.\n");
		return 2;
	} // b did not change, testing creation of polynomials with zero coefficients.
	
	char* resultC[100];
	Poly polyC = NULL;
	char* c = "+-2x^1+2x^0+2x^2";
	polyC = nonrecursiveString2Poly(polyC, c);
	nonrecursivepoly2string(polyC, resultC);
	fprintf(results, "Polynomial C: %s\n", c);
	if(strcmp("+2x^2+-2x^1+2x^0", resultC)){
		fprintf(results, "Polynomial C not parsed properly in subtraction unit test.\n");
		return 3;
	} // c did not change, testing creation of polynomials with negative coefficients.

	char* resultAB[100];
	Poly polyAB = NULL;
	polyAB = multiplyPolynomial(polyA,polyB);
	nonrecursivepoly2string(polyAB, resultAB);
	fprintf(results, "Multiplication with different exponents (A*B): %s\n", resultAB);
	if(strcmp("+4x^3+8x^2+8x^1+4x^0", resultAB)){
		fprintf(results, "Multpilication of Polynomial A and Polynomial B incorrect in multiplication unit test.\n");
		return 4;
	} // a*b is correct, testing multiplication of polynomials with different exponents.
	
	char* resultAC[100];
	Poly polyAC = NULL;
	polyAC = multiplyPolynomial(polyA,polyC);
	nonrecursivepoly2string(polyAC, resultAC);
	fprintf(results, "Multiplication with zero coefficients (A*C): %s\n", resultAC);
	if(strcmp("+4x^4+4x^2+4x^0", resultAC)){
		fprintf(results, "Multpilication of Polynomial A and Polynomial C incorrect in multiplication unit test.\n");
		return 5;
	} // a*c is correct, testing multiplication of polynomials with a resulting zero coefficient.

	char* resultBC[100];
	Poly polyBC = NULL;
	polyBC = multiplyPolynomial(polyB, polyC);
	nonrecursivepoly2string(polyBC, resultBC);
	fprintf(results, "Multiplication with zero coefficient and different exponents (B*C): %s\n", resultBC);
	if(strcmp("+4x^3+4x^0", resultBC)){
		fprintf(results, "Multpilication of Polynomial B and Polynomial C incorrect in multiplication unit test.\n");
		return 6;
	} // b*c is correct, testing multiplication of polynomials with a resulting zero coefficient.

 	char* resultABC[100];
	Poly polyABC = NULL;
	polyABC = multiplyPolynomial(polyAB, polyC);
	nonrecursivepoly2string(polyABC, resultABC);
	fprintf(results, "Multiplication with zero coefficients and different exponents (A*B*C): %s\n", resultABC);
	if(strcmp("+8x^5+8x^4+8x^3+8x^2+8x^1+8x^0", resultABC)){
		fprintf(results, "Multpilication of Polynomial A, Polynomial B, and Polynomial C incorrect in multiplication unit test.\n");
		return 7;
	} // a*b*c is correct, testing large multiplication of polynomials.
	
	fprintf(results, "All multiplication units tests completed successfully.\n\n");
	return 0;
}