/*--------------------------------------------------------------------
Name: Forrest Lang & Jake Orner
Date: 11 Oct 2016
Course: ECE 382
File: pong.h
Event: Lab 4 - Pong

Purp: Implements a subset of the pong game

Doc:    I helped Sharee Acosta, Mario Bracamonte and Brett Wagner

Academic Integrity Statement: I certify that, while others may have
assisted me in brain storming, debugging and validating this program,
the program itself is my own work. I understand that submitting code
which is the work of other individuals is a violation of the honor
code.  I also understand that if I knowingly give my original work to
another individual is also a violation of the honor code.
-------------------------------------------------------------------------*/

#ifndef PONG_H_
#define PONG_H_

#define	SCREEN_HEIGHT	320
#define SCREEN_WIDTH	240

#define TRUE	1
#define FALSE	0

typedef struct vector2d {
	int x;
	int y;
} vector2d_t;

//typedef struct vector2d vector2d_t;

typedef struct {
	vector2d_t position;
	vector2d_t velocity;
	unsigned char radius;
} ball_t, *ballPtr;

typedef struct {
	int x;
	int y;
} paddle_t, *paddlePtr;


ball_t makeBall(int x_pos, int y_pos, int x_vel, int y_vel, unsigned char r );

ball_t moveBall(ball_t ball, paddle_t paddle, unsigned char *score, unsigned char *playGame);

paddle_t newPaddle(int x_pos, int y_pos);

paddle_t movePaddle(paddle_t paddle, int direction);

int game_over(ball_t ball);
#endif /* PONG_H_ */
