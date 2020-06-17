#include "Graph.h"
#include "SDL.h"

int shortestPath( Board *B, int predecessors[] );

int executeAIShort(SDL_Renderer *ren, SDL_MouseButtonEvent e, Board *B, int pred[]);

int executeAICut(SDL_Renderer *ren, SDL_MouseButtonEvent e, Board *B, int pred[]);