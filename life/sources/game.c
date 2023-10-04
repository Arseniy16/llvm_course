#include "graphics_interface.h"
#include "game.h"
#include <time.h>
#include <string.h>


color_t dead = {0, 255, 0}; //green - dead
color_t alive = {255, 0, 0}; //red - alive

int drawGame()
{
    gameUpdate();
    return 0;
}

void initGame()
{
    srand(time(NULL));

    for (unsigned i = 0; i < COUNT_INITIAL_CELLS; ++i)
    {
        unsigned coord_x = rand() % SIM_X_SIZE;
        unsigned coord_y = rand() % SIM_Y_SIZE;

        simSetPixel(coord_x, coord_y, alive);
    }
    return;
}

int isSame(color_t model, color_t test)
{
    return memcmp(&model, &test, sizeof(color_t)) == 0; 
}

int getAliveNeighbours(dir_t neighbour)
{
    unsigned count = 0;

    color_t up = {data[neighbour.up], data[neighbour.up + 1], data[neighbour.up + 2]};
    color_t down = {data[neighbour.down], data[neighbour.down + 1], data[neighbour.down + 2]};
    color_t left = {data[neighbour.left], data[neighbour.left + 1], data[neighbour.left + 2]};
    color_t right = {data[neighbour.right], data[neighbour.right + 1], data[neighbour.right + 2]};
    color_t up_left = {data[neighbour.up_left], data[neighbour.up_left + 1], data[neighbour.up_left + 2]};
    color_t up_right = {data[neighbour.up_right], data[neighbour.up_right + 1], data[neighbour.up_right + 2]};
    color_t down_left = {data[neighbour.down_left], data[neighbour.down_left + 1], data[neighbour.down_left + 2]};
    color_t down_right = {data[neighbour.down_right], data[neighbour.down_right + 1], data[neighbour.down_right + 2]};

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

void gameUpdate()
{
    dir_t neighbour;

    for (unsigned x = 0; x < SIM_X_SIZE - 1; x++) 
    {
        for (unsigned y = 0; y < SIM_Y_SIZE - 1; y++) 
        {
            neighbour.center = (x + y * SIM_X_SIZE) * 3;
            neighbour.up = (x + (y + 1) * SIM_X_SIZE) * 3;
            neighbour.down = (x + (y - 1) * SIM_X_SIZE) * 3;
            neighbour.left = ((x - 1) + y * SIM_X_SIZE) * 3;
            neighbour.right = ((x + 1) + y * SIM_X_SIZE) * 3;
            neighbour.up_left = ((x - 1) + (y + 1) * SIM_X_SIZE) * 3;
            neighbour.up_right = ((x + 1) + (y + 1) * SIM_X_SIZE) * 3;
            neighbour.down_left = ((x - 1) + (y - 1) * SIM_X_SIZE) * 3;
            neighbour.down_right = ((x + 1) + (y - 1) * SIM_X_SIZE) * 3;

            color_t center = {data[neighbour.center], data[neighbour.center + 1], data[neighbour.center + 2]};

            int num_alive_neighbours = getAliveNeighbours(neighbour);

            if (isSame(center, alive))
            {
                printf("num_alive_neighbours: %d\n", num_alive_neighbours);
                if (num_alive_neighbours > 3 || num_alive_neighbours < 2)
                    simSetPixel(x, y, dead);
            } 
            else 
            {
                if (num_alive_neighbours > 2)
                    simSetPixel(x, y, alive);
            }
        }
    }
    return;
}