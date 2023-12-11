#ifndef _SIM_H_
#define _SIM_H_

// #define REPEAT_SIZE 1024
#define COUNT_INITIAL_CELLS 10000
#define FRAME_TICKS 60

#define SIM_X_SIZE 200 //400
#define SIM_Y_SIZE 150 //300
#define SIM_DISPLAY_MEM_ADDR SIM_X_SIZE * SIM_Y_SIZE * 3

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

typedef struct color
{
    unsigned r;
    unsigned g;
    unsigned b;
} color_t;

int simRand();
void drawPixel(int x, int y, color_t color);
void simFlush();

#endif /* _SIM_H_ */