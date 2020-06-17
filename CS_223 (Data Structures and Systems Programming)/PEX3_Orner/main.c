/* Documentation Statement: None*/
#include <stdio.h>
#include <strings.h>
#include "ternary_tree_library.h"
#include "TestsOrner.h"
#define MAX_LINE_LENGTH 1000
#define MAX_WORD_LENGTH 100
#define MAX_LINES 1000
#define MAX_WORDS 10000

int main(int argc, char **argv)
{
	unitTest();
	if(argc < 2){
		printf("Enter a proper file agrument.");
		return 1;
	}
	else if(argc > 2){
		printf("Too many arguments. Only input 1 file.");
		return 1;
	}
	
	TreePtr myDictionary = loadDictionary("Dictionary.txt");

	FILE *input_text = fopen(argv[1], "r"); 
	char line[MAX_LINE_LENGTH];
	char misspelledWords[MAX_WORDS][MAX_WORD_LENGTH];
	char *errorLine[MAX_LINES][MAX_WORD_LENGTH];
	int errorLineNumbers[MAX_LINES];
	char lowerWord[MAX_WORD_LENGTH];
	int lineCount = 0;
	int wordCount = 0;
	int numMisspelled=0;
	char choice = ' ';
	int i=0;

	while(fgets(line, MAX_LINE_LENGTH, (FILE*)input_text) != NULL){
		if(line[strlen(line) - 1] == '\n'){
			line[strlen(line) - 1] = '\0';
		}
		strcpy(errorLine[lineCount], line);
		char *words = strtok(line," ;,.-_\"?!@#$%^&*()[]:+=<>");
		while (words != NULL)
		{
			strcpy(lowerWord, words);
			for(int i=0; i<strlen(words); i++){
				lowerWord[i] = tolower(words[i]);
			}
			if(find(myDictionary, lowerWord) == 0) {
				strcpy(misspelledWords[numMisspelled], words);
				errorLineNumbers[numMisspelled] = lineCount;
				numMisspelled++;
				// Prompts the user at each misspelled word
				if(choice != 'q'){
					printf("Line Number: %d\n", errorLineNumbers[i]);
					printf("Full line: %s\n", errorLine[errorLineNumbers[i]]);
					printf("Misspelled word: %s\n", misspelledWords[i]);
					printf("What would you like to do? (n for next, a to add word, q to quit)");
					scanf("%c", &choice);
					fflush(stdin);
					printf("\n");
				}

				// Stops incorrect input from being processed
				while(choice != 'n' && choice != 'a' && choice != 'q'){
					printf("Invalid input. Please try again.\n");
					printf("Line Number: %d\n", errorLineNumbers[i]);
					printf("Full line: %s\n", errorLine[errorLineNumbers[i]]);
					printf("Misspelled word: %s\n", misspelledWords[i]);
					printf("What would you like to do? (n for next, a to add word, q to quit)");
					scanf("%c", &choice);
					fflush(stdin);
					printf("\n");
				}
				if(choice == 'n'){
					i++;
				}
				else if(choice == 'a'){
					myDictionary = insert(myDictionary, lowerWord);
					printf("%s added to dictionary.\n", misspelledWords[i]);
					numMisspelled--;
				}
			}
			wordCount++;
			words = strtok(NULL, " ;,.-_\"?!@#$%^&*()[]:+=<>");
		}
		lineCount++;
	}
	printf("Total words: %d \t Total Misspelled: %d", wordCount, numMisspelled);
	freeTree(myDictionary);
	return 0;
}
