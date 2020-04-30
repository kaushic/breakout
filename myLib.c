#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;
// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

void setPixel4(int col, int row, unsigned char colorIndex) {
    unsigned short pixelData = videoBuffer[OFFSET(col, row, SCREENWIDTH)/2];
    if (col & 1){
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[OFFSET(col, row, SCREENWIDTH)/2] = pixelData;
}

void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    unsigned short colorData = colorIndex | (colorIndex << 8);
    for (int i = 0; i < height; i++){
        if (col & 1){ //col is odd
            if (width  & 1) { //width is odd
                setPixel4(col, row + i, colorIndex);
                if (width > 1) {
                  DMANow(3, &colorData, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width /2);  
                }
            } else {
                setPixel4(col, row + i, colorIndex);
                if (width > 2) {
                  DMANow(3, &colorData, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH)/2], DMA_SOURCE_FIXED | (width -2)/2);    
                }
                setPixel4(col + width - 1, row + i, colorIndex);
            }
        } else { //col is even
            if (width & 1){ //width is odd
                if (width > 1) {
                    DMANow(3, &colorData, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH)/2], DMA_SOURCE_FIXED | ((width - 1) /2)); 
                }
                setPixel4(col + width - 1, row + i, colorIndex);   
            } else {
                DMANow(3, &colorData, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width /2); 
            }
        }
    }
}

void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short colorData = colorIndex | (colorIndex << 8);
    DMANow(3, &colorData, videoBuffer, DMA_SOURCE_FIXED | ((SCREENWIDTH * SCREENHEIGHT)/2));

}

void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(0, r, width)/2], &videoBuffer[OFFSET(col, row + r, SCREENWIDTH)/2], width/2);
    }
}

void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, ((SCREENWIDTH * SCREENHEIGHT)/2));
}

void waitForVBlank() {
    while(SCANLINECOUNTER > 160);
    while(SCANLINECOUNTER < 160);
}
void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
}
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
