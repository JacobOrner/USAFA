#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ternary_tree_library.h"
#define MAX_WORD_LENGTH 100
#define MAX_DICTIONARY_SIZE 200000


TreePtr loadDictionary(FILE *in){
	FILE *input_cards = fopen(in, "r"); 
	char line[MAX_WORD_LENGTH];
	TreePtr dictionary = NULL;
	char **words = malloc(MAX_DICTIONARY_SIZE * sizeof(char *));
	int count = 0;
	
	words[count] = malloc(MAX_WORD_LENGTH);
	while(fgets(line, MAX_WORD_LENGTH, (FILE*)input_cards) != NULL){
		if(line[strlen(line) - 1] == '\n'){
			line[strlen(line) - 1] = '\0';
		}
		words[count] = malloc(MAX_WORD_LENGTH);
		strcpy(words[count], line);
		count++;
	}
		
	dictionary = insertBalanced(dictionary, words, 0, count-1);

	for(int i=0; i < count; i ++){
		free(words[i]);
	}
	return dictionary;
}

// insert a letter into the binary search tree 
TreePtr insert(TreePtr root, char *word){
	TreePtr temp;
	if(word[0] == '\0' && root == NULL){
		temp = malloc(sizeof(struct tree)); // Creates memory for a term.
		temp -> letter = word[0];
		temp -> left = NULL;
		temp -> down = NULL;
		temp -> right = NULL;
		return temp;
	}
	else if(root == NULL){
		temp = malloc(sizeof(struct tree)); // Creates memory for a term.
		temp -> letter = word[0];
		temp -> left = NULL;
		temp -> right = NULL;
		temp -> down = insert(NULL, &word[1]);
		return temp;
	}
	else if (word[0] > root -> letter){
		root -> right = insert(root -> right, word);
		return root;
	}
	else if(word[0] < root -> letter){
		root -> left = insert(root -> left, word);
		return root;
	}
	else {
		root -> down = insert(root -> down, &word[1]);
		return root;
	}
}

int find(TreePtr root, char *word){
	if(root == NULL){
		return 0;
	}
	if(root -> letter == '\0' && word[0] == '\0'){
		return 1;
	}
	if(word[0] < root -> letter){
		return find(root -> left, word);
	}
	else if(word[0] > root -> letter){
		return find(root -> right, word);
	}
	else{
		return find(root -> down, &word[1]);
	}
}

void freeTree(TreePtr root){
	if(root == NULL){
        return;
	}
	freeTree(root->left);
	freeTree(root->down);
	freeTree(root->right);
	free(root);
}

// Insert an array into the tree
TreePtr insertBalanced(TreePtr root, char *words[], int firstIndex, int lastIndex){
	if(firstIndex > lastIndex){
		return root;
	}
	else{
		int middle = (firstIndex + lastIndex) / 2;
		
		TreePtr temp;
		temp = insert(root, words[middle]);
		temp = insertBalanced(temp, words, firstIndex, middle-1);
		temp = insertBalanced(temp, words, middle+1, lastIndex);
		return temp;
	}
}
