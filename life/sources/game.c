#include "graphics_interface.h"
#include "game.h"
#include <time.h>
#include <string.h>
// #include <stdlib.h>
#include <limits.h>

color_t dead = {0, 0, 255}; //green - dead
color_t alive = {255, 0, 0}; //red - alive

int drawGame()
{
    gameUpdate();
    simFlush(alive);
    return 0;
}
/*
int random_new( )
{
    static bool initialized;
    if ( !initialized )
    {
        srand( time( NULL ) );
        initialized = true;
    }
    int rand_val = rand( );

    if ( RAND_MAX < INT_MAX )
    {
        rand_val |= rand( ) << 16;
    }
    return rand_val;
}

int random_uniform(int n)
{
    int rand_val;
    do
    {
        rand_val = random_new();
    }
    while ( rand_val >= INT_MAX - ( INT_MAX % n ) );
    return rand_val % n ;
}
*/

void initGame()
{
    
    for (unsigned x = 0; x < SIM_X_SIZE; x++)
    {    
        for (unsigned y = 0; y < SIM_Y_SIZE; y++)
        {
            simSetPixel(x, y, dead);
        }
    }

    srand(time(NULL));

    for (unsigned i = 0; i < COUNT_INITIAL_CELLS; ++i)
    {
        
        unsigned coord_x = rand() % (SIM_X_SIZE - 1) + 1;
        unsigned coord_y = rand() % (SIM_Y_SIZE - 1) + 1;
        // unsigned coord_x = random_uniform(SIM_X_SIZE);
        // unsigned coord_y = random_uniform(SIM_Y_SIZE);

        printf("(%d, %d)\n", coord_x, coord_y);

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

    // printf("count = %d\n", count);
    return count;
}

void gameUpdate()
{
    dir_t neighbour;
    unsigned num_alive_neighbours = 0;

    for (unsigned y = 1; y < SIM_Y_SIZE - 1; y++)
    {
        for (unsigned x = 1; x < SIM_X_SIZE - 1; x++)
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

            color_t center = {data[neighbour.center], data[neighbour.center + 1], data[neighbour.center + 2]};

            num_alive_neighbours = getAliveNeighbours(neighbour);

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