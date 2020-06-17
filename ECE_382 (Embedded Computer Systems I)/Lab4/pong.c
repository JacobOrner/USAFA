/*--------------------------------------------------------------------
Name: Forrest Lang & Jake Orner
Date: 11 Oct 2016
Course: ECE 382
File: pong.c
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

#include "pong.h"

extern void Delay40ms();
extern void Delay160ms();
extern void drawBox(unsigned int col, unsigned int row, unsigned int color);
extern void drawLine(unsigned int col, unsigned int row, unsigned int color);

ball_t makeBall(int x_pos, int y_pos, int x_vel, int y_vel, unsigned char r ) {
	ball_t ball;

	ball.position.x = x_pos;
	ball.position.y = y_pos;

	ball.velocity.x = x_vel;
	ball.velocity.y = y_vel;

	ball.radius = r;

	return ball;
}

// ========================================================================
//	Name: newPaddle
//	Inputs: int x_pos, int y_pos
//	Outputs: paddle_t
//	Purpose: Creates a new paddle for the Pong game.
// ========================================================================
paddle_t newPaddle(int x_pos, int y_pos){
	paddle_t paddle;

	paddle.x = x_pos;
	paddle.y = y_pos;

	return paddle;
}

// ====================================================================================================
//	Name: moveBall
//	Inputs: ball_t ball, paddle_t paddle, unsigned char *score, unsigned char *playGame
//	Outputs: ball_t
//	Purpose: moves the ball, increments the score if a hit occurred, and ends the game if necessary.
// ====================================================================================================
ball_t moveBall(ball_t ball, paddle_t paddle, unsigned char *score, unsigned char *playGame) {
	unsigned char checkBounce_left(ball_t ball);
	unsigned char checkBounce_right(ball_t ball);
	unsigned char checkBounce_up(ball_t ball);
	unsigned char checkBounce_down(ball_t ball);
	//unsigned char check_paddle_hit(ball_t ball, paddle_t paddle);

	ball.position.x += ball.velocity.x;
	ball.position.y += ball.velocity.y;

	if ( checkBounce_left(ball) ){
		ball.velocity.x *= -1;
		ball.position.x = 0;
	}
	if (checkBounce_right(ball) ){
		ball.velocity.x *= -1;
		ball.position.x = SCREEN_WIDTH - ball.radius;
	}
	if ( checkBounce_up(ball) ){
		ball.velocity.y *= -1;
		ball.position.y = 0;
	}
	if (checkBounce_down(ball) ){
		ball.velocity.y *= -1;
		ball.position.y = SCREEN_HEIGHT - ball.radius;
	}
	if ( check_paddle_hit(ball, paddle)){
		score++;
		ball.velocity.x *= -1;
		ball.position.x = paddle.x - ball.radius;
	}
	return ball;

}

// ========================================================================
//	Name: game_over
//	Inputs: ball_t ball
//	Outputs: int
//	Purpose: Checks if the ball went past the paddle thus ending the game.
// ========================================================================
int game_over(ball_t ball){
	if(ball.position.x > SCREEN_WIDTH - 10){
		return TRUE;
	}
	else{
		return FALSE;
	}
}

// ========================================================================
//	Name: movePaddle
//	Inputs: paddle_t paddle, int direction
//	Outputs: paddle_t paddle
//	Purpose: Move the paddle in the indicated direction
// ========================================================================
paddle_t movePaddle(paddle_t paddle, int direction){
	paddle.y += 5*direction;

	return paddle;
}

// ========================================================================
//	Name: check_paddle_hit
//	Inputs: ball_t ball, paddle_t paddle
//	Outputs: int
//	Purpose: Checks if the ball hit the paddle.
// ========================================================================
unsigned char check_paddle_hit(ball_t ball, paddle_t paddle){
	if(ball.position.y + ball.radius > paddle.y && ball.position.y < (paddle.y + 30)){
		if(ball.position.x + ball.radius >= paddle.x){
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	else{
		return FALSE;
	}
}

unsigned char checkBounce_left(ball_t ball) {
	if (ball.position.x <= 0) return TRUE;
	return FALSE;
}

unsigned char checkBounce_right(ball_t ball) {
	if (ball.position.x >= SCREEN_WIDTH - ball.radius){
		return TRUE;
	}
	else{
		return FALSE;
	}
}

unsigned char checkBounce_up(ball_t ball) {
	if (ball.position.y <= 0) return TRUE;
		return FALSE;
}

unsigned char checkBounce_down(ball_t ball) {
	if (ball.position.y >= SCREEN_HEIGHT - ball.radius) return TRUE;
		return FALSE;
}
