#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "ballIcon.h"
// Variables
PADDLE paddle;
BALL ball;
BRICK bricks[BRICKCOUNT];
int bricksRemaining;
int gameOver = 0;
int rectCols[] = {0,22,44,66,88,110,132,154,176,198,220};
int color[] = {BLUEID, CYANID, MAGENTAID, YELLOWID};

// Initialize the game
void initGame() {
	unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY, MAGENTA, CYAN, YELLOW};

	DMANow(3, &ballIconPal, PALETTE, 256);
	// Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

	initPaddle();
	initBall();
	bricksRemaining = BRICKCOUNT;

	initBricks();
}

// Updates the game each frame
void updateGame() {
	updatePaddle();
	updateBall();
}

// Draws the game each frame
void drawGame() {
	fillScreen4(BLACKID);
	drawPaddle();
	drawBall();
	for (int i = 0; i < BRICKCOUNT; i++){
		drawBricks(&bricks[i]);
	}
}

// Initialize the paddle
void initPaddle() {
	paddle.height = 2;
	paddle.width = 20;
	paddle.row = (SCREENHEIGHT-10);
	paddle.col = (SCREENWIDTH / 2) - (paddle.width / 2);
	paddle.oldRow = paddle.row;
	paddle.oldCol = paddle.col;
	paddle.cdel = 1;
	paddle.color = WHITEID;
}

// Handle every-frame actions of the paddle
void updatePaddle() {
	if (BUTTON_HELD(BUTTON_LEFT) && paddle.col >= 2) {
		paddle.col -= paddle.cdel;
	} else if (BUTTON_HELD(BUTTON_RIGHT) && paddle.col + paddle.width - 2 < SCREENWIDTH - 2){
		paddle.col  += paddle.cdel;
	}
}

// Draw the paddle
void drawPaddle() {
	drawRect4(paddle.col, paddle.row, paddle.width, paddle.height, paddle.color);
}

// Initialize the ball
void initBall() {
	ball.height = 8;
	ball.width = 8;
	ball.row = (SCREENHEIGHT-(2*ball.height+5));
	ball.col = (SCREENWIDTH / 2) - (ball.width / 2);
	ball.oldRow = ball.row;
	ball.oldCol = ball.col;
	ball.rdel = -1;
	ball.cdel = 1;
	ball.color = MAGENTAID;
	ball.active = 1;
	gameOver = 0;
}

// Handle every-frame actions of the ball
void updateBall() {
	if (ball.row+ ball.height - 1 > SCREENHEIGHT - 1){
        ball.active = 0;
        drawImage4(ball.oldCol, ball.oldRow, ball.row, ball.height, ballIconBitmap);
		gameOver = 1;
    } 
	ball.row += ball.rdel;
	ball.col += ball.cdel;
	if (ball.active){
		 //check if ball is at either edge
		if (ball.col<= 0 || ((ball.col + ball.width -2) > SCREENWIDTH -2)) {            
			ball.cdel *= -1;
		}
		if (ball.row < 0){
			ball.rdel *= -1;
		}
		//collision with paddle
    	if (collision(ball.col,ball.row, ball.width, ball.height, 
		paddle.col, paddle.row, paddle.width, paddle.height)){
        	ball.rdel *= -1;
    	}
		//collision with bricks
		for (int i = 0; i  < BRICKCOUNT; i++){
			if (collision(ball.col, ball.row, ball.width, ball.height, bricks[i].col, bricks[i].row, bricks[i].width, 
			bricks[i].height) && bricks[i].active){
				ball.rdel *= -1;
				updateBricks(&bricks[i]);
			}
		}
	}

    
}

// Draw the ball
void drawBall() {
	if (ball.active){
		drawImage4(ball.col, ball.row, ball.width, ball.height, ballIconBitmap);
	}
}

// Initialize the bricks
void initBricks(){
	for (int i = 0; i < BRICKCOUNT; i++) {
		bricks[i].height = 8;
		bricks[i].width = 12;
		bricks[i].row = 4 + (i / 5) * 18; // padding + (i / 5) + space between each row
		bricks[i].col = 12 + (i % 5) * 48;; // padding + (i % 5) + space between each col
		bricks[i].color = color[i/5];
		bricks[i].active = 1;
		bricks[i].erased = 0;

	}
}
// Update the bricks
void updateBricks(BRICK* b){
	b->active = 0;
	bricksRemaining--;
}
// Draw the bricks
void drawBricks(BRICK* b){
	if(b->active) {
		drawRect4(b->col, b->row, b->width, b->height, b->color);
	}
}