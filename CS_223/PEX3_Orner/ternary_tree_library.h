/* Documentation Statement: None */
#ifndef TERNARY_TREE_LIBRARY_H
#define TERNARY_TREE_LIBRARY_H
typedef struct tree {
	char letter;
	struct tree *left;
	struct tree *down;
	struct tree *right;
} Tree, *TreePtr;


// Load a dictionary into the tree and return the tree
TreePtr loadDictionary(FILE *dictionary);

// Insert an array into the tree
TreePtr insertBalanced(TreePtr root, char *words[], int firstIndex, int lastIndex);

// insert a number into the binary search tree 
TreePtr insert(TreePtr root, char *word);

// Return 1 if item is found, 0 if otherwise.
int find(TreePtr root, char *word);

// Free the Tree!!
void freeTree(TreePtr root);

#endif