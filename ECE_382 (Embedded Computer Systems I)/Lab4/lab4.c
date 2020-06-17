#include <msp430g2553.h>
#include "color.h"
#include "pong.h"

extern void initMSP();
extern void initLCD();
extern void clearScreen();
extern void Delay40ms();
extern void Delay160ms();
extern void drawBox(unsigned int col, unsigned int row, unsigned int color);
extern void drawBall(unsigned int col, unsigned int row, unsigned int color);
extern void drawLine(unsigned int col, unsigned int row, unsigned int color);
extern void drawNumber(unsigned int col, unsigned int row, unsigned int color, unsigned int numberPtr);

#define		TRUE			1
#define		FALSE			0

#define		LEFT_BUTTON		(P2IN & BIT0)
#define 	DOWN_BUTTON		(P2IN & BIT1)
#define		UP_BUTTON		(P2IN & BIT2)
#define		RIGHT_BUTTON	(P2IN & BIT3)
#define		START_BUTTON	(P1IN & BIT3)

void draw_pic();

void main() {

	unsigned int x, y, button_press;
	unsigned int color;

	// === Initialize system ================================================
	IFG1=0; /* clear interrupt flag1 */
	WDTCTL=WDTPW+WDTHOLD; /* stop WD */
	button_press = FALSE;

	initMSP();
	Delay40ms();
	initLCD();
	clearScreen();
	Delay160ms();
	draw_pic();


	// === A Functionality ==================================================
//	color = COLOR_16_RED;
//	ball_t gameBall = makeBall(40, 0, 5, 5, 8);
//	paddle_t paddle = newPaddle(SCREEN_WIDTH - 10, SCREEN_HEIGHT/2);
//	unsigned char score = 0;
//	unsigned char playGame = TRUE;
//	unsigned char paddleMoved = FALSE;
//	int i = 0;
//	gameBall = moveBall(gameBall, paddle, &score, &playGame);
//	Delay160ms();
//
//
//	while (TRUE){
//		if(UP_BUTTON == 0 && paddle.y > 0){
//			color = COLOR_16_BLACK;
//			for(i=0;i<5;i++){
//				drawLine(paddle.x, paddle.y + 25 + i, color);
//			}
//			paddle = movePaddle(paddle, -1);
//			paddleMoved = TRUE;
//		}
//		if(DOWN_BUTTON == 0 && paddle.y < SCREEN_HEIGHT - 30){
//			color = COLOR_16_BLACK;
//			for(i=0;i<5;i++){
//				drawLine(paddle.x, paddle.y + i, color);
//			}
//			paddle = movePaddle(paddle, 1);
//			paddleMoved = TRUE;
//		}
//		color = COLOR_16_BLACK;
//		drawBall(gameBall.position.x, gameBall.position.y,color);
//		if(game_over(gameBall)){
//			main();
//		}
//		gameBall = moveBall(gameBall, paddle, &score, &playGame);
//		color = COLOR_16_RED;
//		if(gameBall.position.x <= 2){
//			draw_pic();
//		}
//		if(paddleMoved == TRUE){
//			for(i=0; i<30; i++){
//				drawLine(paddle.x, paddle.y + i, COLOR_16_RED);
//			}
//		}
//		if(gameBall.position.x <= 2){
//			draw_pic();
//		}
//		drawBall(gameBall.position.x, gameBall.position.y, color);
//		Delay40ms();
//	}

	// === B Functionality ==================================================
//	color = COLOR_16_RED;
//	ball_t gameBall = makeBall(40, 0, 5, 4, 8);
//	paddle_t paddle = newPaddle(SCREEN_WIDTH - 10, SCREEN_HEIGHT/2);
//	unsigned char score = 0;
//
//	gameBall = moveBall(gameBall, paddle, &score);
//	Delay160ms();
//	while (TRUE){
//		color = COLOR_16_BLACK;
//		drawBall(gameBall.position.x, gameBall.position.y,color);
//		gameBall = moveBall(gameBall, paddle, &score);
//		color = COLOR_16_RED;
//		drawBall(gameBall.position.x, gameBall.position.y, color);
//		Delay160ms();
//	}

	// === Required Functionality ===========================================
	x=0;
	y=0;
	color = COLOR_16_RED;
	drawBox(x, y, color);

	while(1) {
		if (LEFT_BUTTON == 0 && x > 0)		x -= 10;
		if (DOWN_BUTTON == 0 && y < 309)	y += 10;
		if (UP_BUTTON == 0 && y > 0)		y -= 10;
		if (RIGHT_BUTTON == 0 && x < 229)	x += 10;
		if (START_BUTTON == 0){
			if (color == COLOR_16_RED) color = COLOR_16_BLACK;
			else color = COLOR_16_RED;
		}
	drawBox(x, y, color);
	Delay160ms();
	}
}

// === Background Image =================================================
void draw_pic(){
	unsigned int color;
	color = COLOR_16_BLUE;
	int i=0;
	for(i=0;i<4;i++){drawBox(50 + i*10,130,color);}

	drawBox(30,140,color);
	drawBox(40,140,color);
	for(i=0;i<5;i++){drawBox(60 + i*10,140,color);}

	drawBox(30,150,color);
	for(i=0;i<4;i++){drawBox(70 + i*10,150,color);}

	for(i=0;i<3;i++){drawBox(20 + i*10,160,color);}
	for(i=0;i<6;i++){drawBox(60 + i*10,160,color);}

	for(i=0;i<4;i++){drawBox(20 + i*10,170,color);}
	for(i=0;i<4;i++){drawBox(80 + i*10,170, color);}

	for(i=0;i<2;i++){drawBox(30 + i*10,180, color);}
	for(i=0;i<2;i++){drawBox(90 + i*10,180, color);}

	color = COLOR_16_WHITE;

	for(i=0;i<2;i++){drawBox(60 + i*10,180, color);}
	for(i=0;i<2;i++){drawBox(60 + i*10,190, color);}
	drawBox(20,190, color);
	drawBox(110,190, color);

	for(i=0;i<3;i++){drawBox(30 + i*10, 200, color);}
	for(i=0;i<3;i++){drawBox(80 + i*10, 200, color);}
	for(i=0;i<8;i++){drawBox(30 + i*10, 210, color);}
	for(i=0;i<4;i++){drawBox(50 + i*10, 220, color);}
}
