/* PEX4 - short-cut - main
 * Authors = Scott Metzger and Jake Orner
 * Instructor = Dr. Carlisle
 * Documentation: None
 */
#undef main //eliminates duplicate main within SDL libraries
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "InstructorGameLogic.h"
#include "MyGraphFunctions.h" //include your graph library here

/*These two functions need to be modified */
int executeTurn(int turn, SDL_Renderer *ren, SDL_MouseButtonEvent e, Board *B, int pred[], int short_int, int cut_int);
int determineWinner(int sp);
/* You'll want to add a method for computerPlayerShort */

void DFS_Recursive(Board *B, int vertex, int *visited_array, SDL_Renderer *ren ) {
	char num_string[100];
	//go 0 to 44
    visited_array[vertex]=1;
//	printf("Visiting vertex %d\n",vertex);
	sprintf(num_string,"%d",vertex);
	stringColor(ren, B->Vertices[vertex].x+5, B->Vertices[vertex].y+5, num_string, red);
	for (int i=0; i<B->num; i++) {
		// got an edge to a place I haven't been before
        if (B->edges[vertex][i]!=noArc &&
			visited_array[i]==0)  {
				DFS_Recursive(B,i,visited_array,ren);
                }
	}
}
void DFS(Board *B, SDL_Renderer *ren ) {
	// I am going to make an array to keep track of who has been visited
	int *visited=malloc(B->num*sizeof(int));
		// nobody visited yet
		for (int i=0; i<B->num; i++) {
			visited[i]=0; 
		}
        DFS_Recursive(B,0,visited, ren);
}



/* The main method may need to be modified to add the selection of Player vs Player or Computer vs Player -- see below */

int main(int argc, char **argv) {
	SDL_Window *win = NULL;
	SDL_Renderer *ren = NULL;
	SDL_Event e;
	Board B;
	B.num = numNodes;
	srand(time(NULL)); // initializes random number generator.

	int quit = GAME_UNDERWAY;
	int random = rand();
	int turn;
	if (random % 2 == 0) {
		turn = CUT_TURN;
	}
	else{
		turn = SHORT_TURN;
	}
	//int turn = CUT_TURN;
	int pred[numNodes];
	int sp;
	int short_int = AI;
	int cut_int = HUMAN;
	int game = 0;
	// TODO!!!
	// Add a simple menu here that shows up in the black console window to choose PvP or Computer vs. Player
	while (game!=1 && game!=2 && game!=3 && game!=4) {
		printf("Choose the method of play:\n");
		printf("1: PvP\n");
		printf("2: CvP\n");
		printf("3: PvC\n");
		printf("4: CvC\n");
		scanf("%d", &game);
		fflush(stdin);
	}
	switch (game) {
		case 1: short_int = HUMAN;
				cut_int = HUMAN;
				break;
		case 2: short_int = AI;
				cut_int = HUMAN;
				break;
		case 3: short_int = HUMAN;
				cut_int = AI;
				break;
		case 4: short_int = AI;
				cut_int = AI;
				break;
		default: short_int = HUMAN;
				 cut_int = HUMAN;
	}

	// Probably don't need to modify anything else below

	initializeGraphicsWindow(&win, &ren);
	SDL_SetRenderDrawColor(ren, 255, 255, 255, 255); // creates a white background for the board
	SDL_RenderClear(ren); //clears the game board to ensure it is plain white
	SDL_RenderPresent(ren); //renders the gameboard to the screen
	if (turn){ stringColor(ren, 5, 5, "Short's Turn:", black); } //displays initial turn
	else{ stringColor(ren, 5, 5, "Cut's Turn:", black); }

	createAndDrawBoard(ren,&B);//generates random planar graph and draws it
	stringColor(ren, width/2, 10, "Click for all turns", black);
	// now we have a Board!!
	DFS(&B, ren);
	sp = shortestPath(&B, pred); // find the first shortest path
	//This is the main loop. 
	//It calls executeTurn once per mouse click until the user quits or someone wins
	while (quit==GAME_UNDERWAY){ 
		while (SDL_PollEvent(&e) != 0) //Loops through event queue
		{
			//User requests quit
			if (e.type == SDL_QUIT) //allows user to x out of program
			{
				quit = USER_QUIT;
			}
			if (e.type == SDL_MOUSEBUTTONDOWN) //handles mouse button events
			{
				turn = executeTurn(turn, ren, e.button, &B, pred, short_int, cut_int);
				sp = shortestPath(&B, pred);
				quit = determineWinner(sp);  //returns 0,2,or 3 as defined above inline with the declaration of quit
			}
		}
		SDL_RenderPresent(ren); //presents changes to the screen that result from the execution of one turn
	}

	// Display who won
	displayWinBanner(ren, quit);

	while ((quit == CUT_WINS) || (quit == SHORT_WINS))  //if there was a winner hold the screen until the game window is closed.
	{
		SDL_RenderPresent(ren); //present changes to the screen

		// wait until the user closes the window
		while (SDL_PollEvent(&e) != 0)
		{
			//User requests quit
			if (e.type == SDL_QUIT)
			{
				quit = USER_QUIT;
			}
		}
	}

	freeGraphicsWindow(&win, &ren);//Terminate SDL and end program
	deleteBoard(&B); //deallocates dynamic memory
	return 0;
}


/*****************************************************************************************************************************/
/********MODIFY THE FOLLOWING TWO FUNCTIONS TO FINISH THE GAME                                                         *******/
/*****************************************************************************************************************************/
/*
//these functions should use your graph library to model the logical game. 
*/

// This method checks to see if someone has won
// Return CUT_WINS, SHORT_WINS, or GAME_UNDERWAY (if noone has won yet)
int determineWinner(int sp)
{
	//int sp = shortestPath();
	if (sp>numNodes) { // ie has to use at least 1 locked edge
		return CUT_WINS;
	}
	else if (sp==0) {
		return SHORT_WINS;
	}
	else {
		return GAME_UNDERWAY;
	}

	//if a path of locked arcs exist from A to B then switch wins. 
	//If there exists no path of remaining arcs from A to B then cut wins
	//return GAME_UNDERWAY;
}

/*
Simple decision logic to handle each SDL event depending on who's turn it is
Returns CUT_TURN or SHORT_TURN depending on who will go next
*/
int executeTurn(int turn, SDL_Renderer *ren, SDL_MouseButtonEvent e, Board *B, int pred[], int short_int, int cut_int){

	if (turn){
		if(short_int){
			return executeAIShort(ren, e, B, pred);
		}
		else{
			return executePlayerShort(ren, e, B);
		}
	}
	else{
		if(cut_int){
			return executeAICut(ren, e, B, pred);
		}
		else{
			return executePlayerCut(ren, e, B);
		}
	}
}

/*****************************************************************************************************************************/
/********ADD YOUR OWN NEW METHODS HERE                                                                                 *******/
/*****************************************************************************************************************************/









