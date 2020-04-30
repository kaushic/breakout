#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "text.h"
#include "breakoutStart.h"
 
// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart();
void startState();
void goToGame();
void gameState();
void goToPause();
void pauseState();
void goToWin();
void winState();
void goToLose();
void loseState();


// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// variables
int seed;
int bricksRemaining;
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch (state)
        {
        case START:
            startState();
            break;
        case GAME:
            gameState();
            break;
        case PAUSE:
            pauseState();
            break;
        case WIN:
            winState();
            break;
        case LOSE:
            loseState();
            break;

        default:
            break;
        }
               
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    goToStart();
}


void goToStart(){
    DMANow(3, &breakoutStartPal, PALETTE, 256);
    drawFullscreenImage4(breakoutStartBitmap);
    drawString4(60, 30, "Press Enter to Start", BLACKID);
    waitForVBlank();
    flipPage();
    state = START;
    seed = 0;

}

void startState(){
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)){
        srand(seed);
        goToGame();
        initGame();
    }
}

void goToGame(){
    state = GAME;
}

void gameState(){
    updateGame();
    drawGame();

    sprintf(buffer, "Bricks Remaining: %d", bricksRemaining);
    drawString4(5, 130, buffer, WHITEID);

    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)){
        goToPause();
    }
    if (bricksRemaining == 0){
        goToWin();
    } 
    if (gameOver == 1){
        goToLose();
    }
}

void goToPause(){
    fillScreen4(GRAYID);
    drawString4(120-15, 80-3, "Pause", BLACKID);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void pauseState(){
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)){
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)){
        goToStart();
    } 
}

void goToWin(){
    fillScreen4(GREENID);
    drawString4(120-12, 80-3, "Win", BLACKID);
    waitForVBlank();
    flipPage();
    state = WIN;
}

void winState(){
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)){
        goToStart();
    }
}

void goToLose(){
    fillScreen4(REDID);
    drawString4(120-12, 80-3, "Lose", BLACKID);
    waitForVBlank();
    flipPage();
    state = LOSE;
}

void loseState(){
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)){
        goToStart();
    }
}