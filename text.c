#include "myLib.h"
#include "text.h"
#include "font.h"

void drawChar4(int col, int row, char ch, unsigned char colorIndex) {
    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + OFFSET(c, r, 6)]) {
                setPixel4(col+c, row+r, colorIndex);
            }
        }
    }
}

void drawString4(int col, int row, char *str, unsigned char colorIndex) {
    while(*str != '\0') {
        drawChar4(col, row, *str, colorIndex);
        col += 6;
        str++;
    }
}