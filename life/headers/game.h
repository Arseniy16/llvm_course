#ifndef _GAME_H_
#define _GAME_H_

#include "graphics_interface.h"

// #define REPEAT_SIZE 1024
#define COUNT_INITIAL_CELLS 20000

typedef struct direction
{   
    unsigned center;
    unsigned up;
    unsigned down;
    unsigned left;
    unsigned right;
    unsigned up_left;
    unsigned up_right;
    unsigned down_left;
    unsigned down_right;
} dir_t;

extern color_t dead; //blue - dead
extern color_t alive; //red - alive

extern void drawGame();
extern void initGame();
extern int isSame(color_t model, color_t test);
extern int getAliveNeighbours(dir_t neighbour);
extern void gameUpdate();


#endif /* _GAME_H_ */