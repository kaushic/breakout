// Paddle Struct
typedef struct{
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
} PADDLE;

// Bricks Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BRICK;


// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BALL;

// Constants
#define BRICKCOUNT 20

#define NUMCOLORS 9
// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID, MAGENTAID, CYANID, YELLOWID};
extern unsigned short colors[NUMCOLORS];

// Variables
extern PADDLE paddle;
extern BRICK bricks[BRICKCOUNT];
extern BALL ball;
extern int bricksRemaining;
extern int gameOver;
// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
void initPaddle();
void updatePaddle();
void drawPaddle();
void initBall();
void updateBall();
void drawBall();
void initBricks();
void updateBricks(BRICK *);
void drawBricks(BRICK *);

