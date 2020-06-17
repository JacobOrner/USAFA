#include "MyGraphFunctions.h"
#include "Graph.h"
#include "PriorityQueue.h"
#include "InstructorGameLogic.h"

int shortestPath( Board *B, int predecessors[] ){
	int visited[numNodes];
	int distances[numNodes];
	int v;
	int dist;
	int pred;
	QueuePtr Q = initialize();
	
	for (int i = 0; i < numNodes; i++ ){
		distances[i] = noArc;
		visited[i] = 0;
		predecessors[i] = -1;
	}
	
	enqueue(Q, 0, 0, -1);
	
	while( !isEmpty(Q) ) {
		dequeue(Q, &v, &dist, &pred);
		if (!visited[v]) {
				visited[v] = 1;
				distances[v] = dist;
				predecessors[v] = pred;
				for (int w = 0; w < numNodes; w++) {
					if (!visited[w] && B->edges[v][w] != noArc){
						enqueue(Q, w, distances[v]+B->edges[v][w], v);
					}
				}
		}
	}
	
	return distances[numNodes-1];
}

int executeAIShort(SDL_Renderer *ren, SDL_MouseButtonEvent e, Board *B, int pred[]){
	int v = numNodes -1;
	int w = pred[v];
	while( B->edges[v][w] != 1 && v != 0){
		v = w;
		w = pred[v];
	}
	B->edges[v][w] = lockedArc;
	B->edges[w][v] = lockedArc;
	
	lockArc(ren, B->Vertices[findIndex(B, v)].x, B->Vertices[findIndex(B, v)].y, B->Vertices[findIndex(B, w)].x, B->Vertices[findIndex(B, w)].y);
	if (B->Vertices[findIndex(B, v)].locked>0){
		endNode(ren, B->Vertices[findIndex(B, v)].x, B->Vertices[findIndex(B, v)].y);
	}
	else{ drawNode(ren, B->Vertices[findIndex(B, v)].x, B->Vertices[findIndex(B, v)].y); }
	
	if (B->Vertices[findIndex(B, w)].locked>0){
		endNode(ren, B->Vertices[findIndex(B, w)].x, B->Vertices[findIndex(B, w)].y);
	}
	else{ drawNode(ren, B->Vertices[findIndex(B, w)].x, B->Vertices[findIndex(B, w)].y); }
	
	//the next two lines rotate the turn display...you should not need to chagne this
	stringColor(ren, 5, 5, "Short's Turn:", white);
	stringColor(ren, 5, 5, "Cut's Turn:", black);
	return CUT_TURN;
}

int executeAICut(SDL_Renderer *ren, SDL_MouseButtonEvent e, Board *B, int pred[]){
	// starts from the first vertex in the shortest path.
	int short_path[numNodes-1];
	int v = numNodes-1;
	int j = 0;
	while( v >= 0){
		short_path[j] = v;
		v = pred[v];
		j++;
	}
	
	j-=2; // j is the location in the array of the vertex next to zero n the shortest path

	v = 0; // we want to start at 0
	int w = short_path[j]; // v,w is now the edge from 0 to the first node in the shortest path.
	while( B->edges[v][w] != 1 ){ 
		v = w;
		j--;
		w = short_path[j];
	}
	B->edges[v][w] = noArc;
	B->edges[w][v] = noArc;
	eraseArc(ren, B->Vertices[findIndex(B, v)].x, B->Vertices[findIndex(B, v)].y, B->Vertices[findIndex(B, w)].x, B->Vertices[findIndex(B, w)].y);

	if (B->Vertices[findIndex(B, v)].locked>0){
		endNode(ren, B->Vertices[findIndex(B, v)].x, B->Vertices[findIndex(B, v)].y);
	}
	else{ drawNode(ren, B->Vertices[findIndex(B, v)].x, B->Vertices[findIndex(B, v)].y); }
	
	if (B->Vertices[findIndex(B, w)].locked>0){
		endNode(ren, B->Vertices[findIndex(B, w)].x, B->Vertices[findIndex(B, w)].y);
	}
	else{ drawNode(ren, B->Vertices[findIndex(B, w)].x, B->Vertices[findIndex(B, w)].y); }

	//the next two lines rotate the turn display...you should not need to chagne this
	stringColor(ren, 5, 5, "Short's Turn:", black);
	stringColor(ren, 5, 5, "Cut's Turn:", white);
	
	return SHORT_TURN;
}