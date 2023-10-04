#ifndef _GRAPHICS_INTERFACE_H_
#define _GRAPHICS_INTERFACE_H_

#include <SFML/Graphics.hpp>

#define SIM_X_SIZE 800
#define SIM_Y_SIZE 600
#define SIM_DISPLAY_MEM_ADDR SIM_X_SIZE * SIM_Y_SIZE * 3

#define SIM_FRAME_LIMIT 60

extern unsigned int data[SIM_DISPLAY_MEM_ADDR];

typedef struct color
{
    unsigned r;
    unsigned g;
    unsigned b;
} color_t;


extern void simSetPixel(int x, int y, color_t color);
extern void simFlush();

extern void initWindow();
extern void runGame();


// extern void simBkpt();
// extern int simRand();


#endif /* _GRAPHICS_INTERFACE_H_ */