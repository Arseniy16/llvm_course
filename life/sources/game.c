#include "graphics_interface.h"
#include "game.h"
#include <time.h>
#include <string.h>

color_t dead = {0, 0, 255}; //blue - dead
color_t alive = {255, 0, 0}; //red - alive

void drawGame()
{
    gameUpdate();
    simFlush();

    return;
}

/* init starting parameters */
void initGame()
{    
    for (unsigned x = 0; x < SIM_X_SIZE; x++)
    {    
        for (unsigned y = 0; y < SIM_Y_SIZE; y++)
        {
            simSetPixel(x, y, dead, prev_gen);
        }
    }

    srand(time(NULL));

    for (unsigned i = 0; i < COUNT_INITIAL_CELLS; i++)
    {
        unsigned coord_x = rand() % (SIM_X_SIZE - 1) + 1;
        unsigned coord_y = rand() % (SIM_Y_SIZE - 1) + 1;
        simSetPixel(coord_x, coord_y, alive, prev_gen);
    }

    unsigned pos = 0;

    /* fill the border */
    for (unsigned x = 0; x < SIM_X_SIZE; x++)
    {
        pos = (x + 0 * SIM_X_SIZE) * 3;
        simSetPixel(x, 0, {prev_gen[pos], prev_gen[pos + 1], prev_gen[pos + 2]}, next_gen);
        pos = (x + (SIM_Y_SIZE - 1) * SIM_X_SIZE) * 3;
        simSetPixel(x, SIM_Y_SIZE - 1, {prev_gen[pos], prev_gen[pos + 1], prev_gen[pos + 2]}, next_gen);
    }
    for (unsigned y = 0; y < SIM_Y_SIZE; y++)
    {
        pos = (0 + y * SIM_X_SIZE) * 3;
        simSetPixel(0, y, {prev_gen[pos], prev_gen[pos + 1], prev_gen[pos + 2]}, next_gen);
        pos = ((SIM_X_SIZE - 1) + y * SIM_X_SIZE) * 3;
        simSetPixel(SIM_X_SIZE - 1, y, {prev_gen[pos], prev_gen[pos + 1], prev_gen[pos + 2]}, next_gen);
    }

    return;
}

/* check pixels for similarity */
int isSame(color_t model, color_t test)
{
    return memcmp(&model, &test, sizeof(color_t)) == 0; 
}

/* get alive neighbours for the particular pixel */
int getAliveNeighbours(dir_t neighbour)
{
    unsigned count = 0;

    color_t up = {prev_gen[neighbour.up], prev_gen[neighbour.up + 1], prev_gen[neighbour.up + 2]};
    color_t down = {prev_gen[neighbour.down], prev_gen[neighbour.down + 1], prev_gen[neighbour.down + 2]};
    color_t left = {prev_gen[neighbour.left], prev_gen[neighbour.left + 1], prev_gen[neighbour.left + 2]};
    color_t right = {prev_gen[neighbour.right], prev_gen[neighbour.right + 1], prev_gen[neighbour.right + 2]};
    color_t up_left = {prev_gen[neighbour.up_left], prev_gen[neighbour.up_left + 1], prev_gen[neighbour.up_left + 2]};
    color_t up_right = {prev_gen[neighbour.up_right], prev_gen[neighbour.up_right + 1], prev_gen[neighbour.up_right + 2]};
    color_t down_left = {prev_gen[neighbour.down_left], prev_gen[neighbour.down_left + 1], prev_gen[neighbour.down_left + 2]};
    color_t down_right = {prev_gen[neighbour.down_right], prev_gen[neighbour.down_right + 1], prev_gen[neighbour.down_right + 2]};
    
    if (isSame(alive, up))
        ++count;
    if (isSame(alive, down))
        ++count;
    if (isSame(alive, left))
        ++count;
    if (isSame(alive, right))
        ++count;
    if (isSame(alive, up_left))
        ++count;
    if (isSame(alive, up_right))
        ++count;
    if (isSame(alive, down_left))
        ++count;
    if (isSame(alive, down_right))
        ++count;

    return count;
}

/* update the game scene */
void gameUpdate()
{
    dir_t neighbour;
    unsigned num_alive_neighbours = 0;

    /* check each pixel according to the rules of the game of life */
    for (unsigned x = 1; x < SIM_X_SIZE - 1; x++)
    {
        for (unsigned y = 1; y < SIM_Y_SIZE - 1; y++)
        {
            neighbour.center = (x + y * SIM_X_SIZE) * 3;
            neighbour.up = (x + (y - 1) * SIM_X_SIZE) * 3;
            neighbour.down = (x + (y + 1) * SIM_X_SIZE) * 3;
            neighbour.left = ((x - 1) + y * SIM_X_SIZE) * 3;
            neighbour.right = ((x + 1) + y * SIM_X_SIZE) * 3;
            neighbour.up_left = ((x - 1) + (y - 1) * SIM_X_SIZE) * 3;
            neighbour.up_right = ((x + 1) + (y - 1) * SIM_X_SIZE) * 3;
            neighbour.down_left = ((x - 1) + (y + 1) * SIM_X_SIZE) * 3;
            neighbour.down_right = ((x + 1) + (y + 1) * SIM_X_SIZE) * 3;

            color_t center = {prev_gen[neighbour.center], prev_gen[neighbour.center + 1], prev_gen[neighbour.center + 2]};

            num_alive_neighbours = getAliveNeighbours(neighbour);
            
            // printf("num_alive_neighbours: %d\n", num_alive_neighbours);

            if (isSame(center, alive))
            {
                if (num_alive_neighbours > 3 || num_alive_neighbours < 2)
                    simSetPixel(x, y, dead, next_gen);
                else
                    simSetPixel(x, y, alive, next_gen);
            } 
            else
            {
                if (num_alive_neighbours > 2)
                    simSetPixel(x, y, alive, next_gen);
                else 
                    simSetPixel(x, y, dead, next_gen);
            }
        }
    }

    return;
}