#ifndef _GRAPHICS_INTERFACE_H_
#define _GRAPHICS_INTERFACE_H_

#include <SFML/Graphics.hpp>

#define WIN_POS_X 50
#define WIN_POS_Y 50 
#define SIM_FRAME_LIMIT 60

#define SIM_X_SIZE 800
#define SIM_Y_SIZE 600
#define SIZE_PIXEL 4
#define SIM_DISPLAY_MEM_ADDR SIM_X_SIZE * SIM_Y_SIZE * 3

extern unsigned data_prev[SIM_DISPLAY_MEM_ADDR];
extern unsigned data_new[SIM_DISPLAY_MEM_ADDR]; 

extern unsigned *prev_gen;
extern unsigned *next_gen;

typedef struct color
{
    unsigned r;
    unsigned g;
    unsigned b;
} color_t;

extern void simSetPixel(unsigned x, unsigned y, color_t color, unsigned *data);
extern void drawPixel(unsigned x, unsigned y, color_t color);
extern void swapData(unsigned **prev, unsigned **next);
extern void simFlush();
extern void initWindow();
extern void runGame();

#endif /* _GRAPHICS_INTERFACE_H_ */