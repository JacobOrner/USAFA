#include <stdio.h>
#include <stdlib.h>
#include "TestsOrner.h"

int unitTest(){
	
	TreePtr myDictionary = NULL;
	myDictionary = loadDictionary("Dictionary.txt");
//	
//	myDictionary = loadDictionary("tiny_dictionary.txt");
//	if(myDictionary == NULL){
//		printf("Fail - tiny_dictionary not loaded correctly\n\n");
//	}
//	myDictionary = loadDictionary("small_dictionary.txt");
//	if(myDictionary == NULL){
//		printf("Fail - small_dictionary not loaded correctly\n\n");
//	}
	
	printf("\n**Testing Insert Method**");
	int insert_count = 0;
	myDictionary = insert(myDictionary, "blabla");
	if(find(myDictionary, "blabla") == 0){
		printf("Failed - 'blabla' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "manbearpig");
	if(find(myDictionary, "manbearpig") == 0){
		printf("Failed - 'manbearpig' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "doge");
	if(find(myDictionary, "doge") == 0){
		printf("Failed - 'doge' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "yolo");
	if(find(myDictionary, "yolo") == 0){
		printf("Failed - 'yolo' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "yellowclaw");
	if(find(myDictionary, "yellowclaw") == 0){
		printf("Failed - 'yellowclaw' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "yuge");
	if(find(myDictionary, "yuge") == 0){
		printf("Failed - 'yuge' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "delogrand");
	if(find(myDictionary, "delogrand") == 0){
		printf("Failed - 'delogrand' not inserted correctly\n");
		insert_count++;
	}
	myDictionary = insert(myDictionary, "yeet");
	if(find(myDictionary, "yeet") == 0){
		printf("Failed - 'yeet' not inserted correctly\n");
		insert_count++;
	}
	printf("Insert method passed %d/8 tests\n", 8 - insert_count);
	
	printf("**Testing Find Method**");
	int find_count = 0;
	if(find(myDictionary, "appl") == 1){
		printf("Failed - 'appl' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "apple") == 0){
		printf("Failed - 'apple' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "appley") == 1){
		printf("Failed - 'appley' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "kittie") == 1){
		printf("Failed - 'kittie' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "kitties") == 0){
		printf("Failed - 'kitties' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "kittiess") == 1){
		printf("Failed - 'kittiess' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "pupp") == 1){
		printf("Failed - 'pupp' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "puppy") == 0){
		printf("Failed - 'puppy' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "puppyz") == 1){
		printf("Failed - 'puppyz' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "lemo") == 1){
		printf("Failed - 'lemo' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "lemon") == 0){
		printf("Failed - 'lemon' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "lemona") == 1){
		printf("Failed - 'lemona' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "garbag") == 1){
		printf("Failed - 'garbag' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "garbage") == 0){
		printf("Failed - 'garbage' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "garbagee") == 1){
		printf("Failed - 'garbagee' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "taugh") == 1){
		printf("Failed - 'taugh' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "taught") == 0){
		printf("Failed - 'taught' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "taughts") == 1){
		printf("Failed - 'taughts' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "yello") == 1){
		printf("Failed - 'yello' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "yellow") == 0){
		printf("Failed - 'yellow' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "yelloww") == 1){
		printf("Failed - 'yelloww' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "watermel") == 1){
		printf("Failed - 'watermel' is not a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "watermelon") == 0){
		printf("Failed - 'watermelon' is a real word.\n");
		find_count++;
	}
	if(find(myDictionary, "watermelonaze") == 1){
		printf("Failed - 'watermelonaze' is not a real word.\n");
		find_count++;
	}
	printf("Find method passed %d/24 tests\n", 24 - find_count);
	
	printf("Testing completed\n\n");
	return 1;
}