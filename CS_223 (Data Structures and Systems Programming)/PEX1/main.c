#include <stdio.h>
#include <ctype.h>
// Documentation:
// Used http://www.freeformatter.com/credit-card-number-generator-validator.html test card numbers and find valid numbers.
// Used http://bradconte.com/cc_generator to generate valid card numbers.
// Referenced http://www.tutorialspoint.com/cprogramming/c_multi_dimensional_arrays.htm to work on creating 2-D Arrays for Damm's Algorithm.
// Refernced http://www.tutorialspoint.com/c_standard_library/c_function_strcmp.htm to find out about strcmp() method.
// Referenced http://www.tutorialspoint.com/cprogramming/c_file_io.htm to find out about writing into text files.
// Referenced http://www.tutorialspoint.com/c_standard_library/c_function_fprintf.htm
// Received extra card numbers from John Johnson, who also informed me that an output file was required for the PEX.

typedef struct card{
	int m; 
	int y; 
	char company[12]; 
	char number[20];
} Card;

int populate_card(char line[], struct card* card){
	//This method populates the card, it assigns the card's month, date, company, and number. 
	//If the card number length's are too long it will return a flag.
	//If the company name does not begin with a valid letter it will return a flag.
	int space_count = 0;
	
	card->m = (line[0] - 48) * 10 + line[1] - 48;
	card->y = (line[3] - 48) * 10 + line[4] - 48;
		
	if(tolower(line[6]) == 'm'){
		for(int i=0; i<10; i++){
			card->company[i] = toupper(line[i+6]); //Assigns card company name
		}
		for(int i=0; i<16; i++){
			while(ispunct(line[i + 17 + space_count])){ //Checks for dashes in the card number
				space_count++;
			}
			card->number[i] = line[i + 17 + space_count]; //Assigns card number without dashes
		}
		if(line[33 + space_count] >= '0' && line[33 + space_count] <= '9'){ //Checks for an invalid card number length
			return 2; //Gives invalid card length signal
		}
		card->number[16] = '\0'; //Assigns position after number to a null byte
		return 0; //Gives good signal
	}
	else{
		if(tolower(line[6]) == 'd'){
			for(int i=0; i<8; i++){
				card->company[i] = toupper(line[i+6]); //Assigns card company name
			}
			for(int i=0; i<16; i++){
				while(ispunct(line[i + 15 + space_count])){ //Checks for dashes in the card number
					space_count++;
				}
				card->number[i] = line[i + 15 + space_count]; //Assigns card number without dashes
			}
			if(line[31 + space_count] >= '0' && line[31 + space_count] <= '9'){ //Checks for an invalid card number length
				return 2; //Gives invalid card length signal
		}
			card->number[16] = '\0'; //Assigns position after number to a null byte
			return 0; //Gives good signal
		}
		else{
			if(tolower(line[6]) == 'v'){
				for(int i=0; i<4; i++){
					card->company[i] = toupper(line[i+6]); //Assigns card company name
				}
				for(int i=0; i<16; i++){
					while(ispunct(line[i + 11 + space_count])){ //Checks for dashes in the card number
					space_count++;
				}
				card->number[i] = line[i + 11 + space_count]; //Assigns card number without dashes
				}
				if(card->number[13] < '0' || card->number[13] > '9'){
						card->number[13] = '\0'; //Assigns position after number to a null byte
				}
				else{
					if(line[27 + space_count] >= '0' && line[27 + space_count] <= '9'){ //Checks for an invalid card number length
						return 2; //Gives invalid card length signal
					}
					card->number[16] = '\0'; //Assigns position after number to a null byte
				}
				return 0; //Gives good signal
			}
			else{
				if(tolower(line[6]) == 'a'){
					for(int i=0;i<4; i++){
						card->company[i] = toupper(line[i+6]); //Assigns card company name
					}
					for(int i=0; i<15; i++){
						while(ispunct(line[i + 11 + space_count])){ //Checks for dashes in the card number
							space_count++;
						}
					card->number[i] = line[i + 11 + space_count]; //Assigns card number without dashes
					}
					if(line[26 + space_count] >= '0' && line[26 + space_count] <= '9'){ //Checks for an invalid card number length
						return 2; //Gives invalid card length signal
					}
					card->number[15] = '\0'; //Assigns position after number to a null byte
					return 0; //Gives good signal
				}
				else{
					if(tolower(line[6]) == 'j'){
						for(int i=0; i<3; i++){
							card->company[i] = toupper(line[i+6]); //Assigns card company name
						}
						for(int i=0; i<15; i++){
							while(ispunct(line[i + 10 + space_count])){ //Checks for dashes in the card number
								space_count++;
							}
						card->number[i] = line[i + 10 + space_count]; //Assigns card number without dashes
						}
						if(line[25 + space_count] >= '0' && line[25 + space_count] <= '9'){ //Checks for an invalid card number length
							return 2; //Gives invalid card length signal
						}
						card->number[15] = '\0'; //Assigns position after number to a null byte
						return 0; //Gives good signal
					}
					else{
						return 1; //Gives invalid card company signal
					}
				}
			}
		}
	}
}

int validate_prefix(struct card* card){
	//This method validate the number prefix and the number length.
	//If the company name does not match exactly, it throws a flag.
	//If the card number prefix is not correct for the card's specific company it throws a flag.
	//If the card number length is not correct it throws a flag
	if(strcmp("MASTERCARD", card->company) == 0){ //Checks card company name
		if(card->number[0] != '5' || !(card->number[1] >= '1' && card->number[1] <= '5')){
			return 1; //Gives a bad prefix signal
		}
	}
	else{
		if(strcmp("DISCOVER", card->company) == 0){ //Checks card company name
			if(card->number[0] != '6' || card->number[1] != '0' || card->number[2] != '1' || card->number[3] != '1'){
				return 1; //Gives a bad prefix signal
			}
		}
		else{
			if(strcmp("VISA", card->company) == 0){ //Checks card company name
				if(card->number[0] != '4'){
					return 1; //Gives a bad prefix signal
				}
			}
			else{
				if(strcmp("AMEX", card->company) == 0){ //Checks card company name
					if(card->number[0] != '3' || (card->number[1] != '4' && card->number[1] != '7')){
						return 1; //Gives a bad prefix signal
					}
				}
				else{
					if(strcmp("JCB", card->company) == 0){ //Checks card company name
						if((card->number[0] != '2' || card->number[1] != '1' || card->number[2] != '3' || card->number[3] != '1') && (card->number[0] != '1' || card->number[1] != '8' || card->number[2] != '0' || card->number[3] != '0')){
							return 1; //Gives a bad prefix signal
						}
					}
					else{
						return 3; //Returning an invalid company signal.
					}
				}
			}
		}
	}
}

int validate_check_digit(struct card* card){
	//This method validates the check digit for the credit card.
	//If the company is not JCB it begins the Luhn-Mod 10 Algorithm, if it is JCB is runs Damm's algorithm on the card number.
	int sum_digits = 0;
	int current_number = 0;
	int check_digit =0;
	
	if(card->company[0] == 'J'){ //Begins Damm's Algorithm
		int table[10][10]=
			{{0,3,1,7,5,9,8,6,4,2},{7,0,9,2,1,5,4,8,6,3},{4,2,0,6,8,7,1,3,5,9},{1,7,5,0,9,8,3,4,2,6},{6,1,2,3,0,4,5,9,7,8},
			{3,6,7,4,2,0,9,5,8,1},{5,8,6,9,7,2,0,1,3,4},{8,9,4,5,3,6,2,0,1,7},{9,4,3,8,6,1,7,2,0,9},{2,5,8,1,4,3,6,7,9,0}};
		int current = 0;
		int card_digit = card->number[0] - '0';
		for(int i = 0; i < 14; i++){
			card_digit = card->number[i] - '0';
			current = table[current][card_digit]; //Creates the new row number using the current and the card digit at the index.
		}
		card_digit = card->number[strlen(card->number) - 1] - 48; //Finds the check digit of the card

		if(current == card_digit){
			return 1; //Returns a good signal.
		}
		else{
			return 0; // Returns an invalid check digit signal.
		}
	}
	else{ //Begins the Luhn-Mod 10 Algorithm
		check_digit = card->number[strlen(card->number) - 1] - '0'; //Creates the check digit
		for(int i = strlen(card->number) - 2; i >= 0; i--){
			current_number = card->number[i] - '0'; //Pulls the current place in the string, turns it into an int
			if(strlen(card->number) % 2 == 0){ //If the card is an odd length, double every even index
				if(i % 2 == 0){
					if((current_number * 2) > 9){ //If the doubled number is greater than 10, then the digits are added.
						sum_digits += ((current_number * 2) % 10) + ((current_number * 2) / 10);
					}
					else{
						sum_digits += current_number * 2;
					}
				}
				else{
					sum_digits += current_number;
				}
			}
			else{ //If the card is an odd length, double every odd index.
				if(i % 2 == 1){
					if((current_number * 2) > 9){
						sum_digits += ((current_number * 2) % 10) + ((current_number * 2) / 10);
					}
					else{
						sum_digits += current_number * 2;
					}
				}
				else{
					sum_digits += current_number;
				}
			}
		}
		sum_digits = (sum_digits * 9) % 10; //Take the sum * 9 % 10 to get the check digit.
		if(sum_digits == check_digit){
			return 1; //Returns a good signal
		}
		else{
			return 0; //Returns an invalid check digit signal
		}
	}
}

int validate_dates(struct card* card){
	//Checks to ensure the expiration dates included in the card data are valid.
	if(card->m >= 1 && card->m <= 12){ //Checks the month is valid
		if(card->y > 16 && card->y <= 99){
			return 1;
		}
		else{
			if(card->y == 16){ //If the year is this year
				if(card->m > 1){ //Checks the month is valid
					return 1; //Gives an all good signal
				}
				else{
					return 0; //Gives an invalid dates signal
				}
			}
		}
	}
	else{
		return 0; //Gives an invalid dates signal
	}
}

int main(int argc, char **argv){
	FILE *input_cards;
	FILE *output_cards;
	char line[255];
	input_cards = fopen(argv[1], "r"); 
	struct card card = {0, 0, "", ""};
	output_cards = fopen("Validated_Cards.txt", "w");
	
	while(fgets(line, 255, (FILE*)input_cards) != NULL){
		if(line[strlen(line) - 1] == '\n'){
			line[strlen(line) - 1] = '\0';
		}
			
		struct card card = {0, 0, "", ""};
		if(strlen(line) < 20){
			fprintf(output_cards,"INSUFFICIENT CARD DATA \n");
		}
		else{
			if(populate_card(line, &card) == 1){
				fprintf(output_cards,"%d/%d ", card.m, card.y);
				for(int i = 6; i < strlen(line) - 1; i++){
					if(!ispunct(line[i])){
						fprintf(output_cards,"%c", toupper(line[i]));
					}
				}
				fprintf(output_cards," INVALID CARD COMPANY \n");
			}
			else{
				if(populate_card(line, &card) == 2){
					fprintf(output_cards,"%d/%d ", card.m, card.y);
					for(int i = 6; i < strlen(line); i++){
						if(!ispunct(line[i])){
							fprintf(output_cards,"%c", toupper(line[i]));
						}
					}
					fprintf(output_cards," INVALID ACCOUNT NUMBER LENGTH \n");}
				else{
					if(!validate_dates(&card)){
						fprintf(output_cards,"%d/%d %s %s INVALID EXPIRED \n", card.m, card.y, card.company, card.number);
					}
					else{
						if(validate_prefix(&card) == 1){
							fprintf(output_cards,"%d/%d %s %s INVALID NETWORK PREFIX\n", card.m, card.y, card.company, card.number);
						}
						else{
							if(validate_prefix(&card) == 3){
								fprintf(output_cards,"%d/%d %s %s INVALID CARD COMPANY \n", card.m, card.y, card.company, card.number);
							}
							else{
								if(!validate_check_digit(&card)){
									fprintf(output_cards,"%d/%d %s %s INVALID CHECK DIGIT \n", card.m, card.y, card.company, card.number);
								}
								else{
									fprintf(output_cards,"%d/%d %s %s VALID \n", card.m, card.y, card.company, card.number);
								}
							}
						}
					}
				}
			}
		}
	}
	fclose(input_cards);
	fclose(output_cards);
	return 0;
}