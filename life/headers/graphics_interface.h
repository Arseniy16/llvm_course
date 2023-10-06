#ifndef _GRAPHICS_INTERFACE_H_
#define _GRAPHICS_INTERFACE_H_

#include <SFML/Graphics.hpp>

#define WIN_POS_X 50
#define WIN_POS_Y 50 
#define SIM_FRAME_LIMIT 40

#define SIM_X_SIZE 800
#define SIM_Y_SIZE 600
#define SIZE_PIXEL 4
#define SIM_DISPLAY_MEM_ADDR SIM_X_SIZE * SIM_Y_SIZE * 3


extern unsigned int data[SIM_DISPLAY_MEM_ADDR];

typedef struct color
{
    unsigned r;
    unsigned g;
    unsigned b;
} color_t;


extern void simSetPixel(unsigned x, unsigned y, color_t color);
extern void simFlush(color_t color);

extern void initWindow();
extern void runGame();


// extern void simBkpt();
// extern int simRand();


#endif /* _GRAPHICS_INTERFACE_H_ */