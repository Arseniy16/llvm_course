#include "graphics_interface.h"
#include <SFML/Graphics.hpp>
#include "game.h"
#include <stdio.h>

unsigned data_prev[SIM_DISPLAY_MEM_ADDR];
unsigned data_new[SIM_DISPLAY_MEM_ADDR];

unsigned *prev_gen = data_prev;
unsigned *next_gen = data_new;

sf::RenderWindow window;

/* set pixel for data */
void simSetPixel(unsigned x, unsigned y, color_t color, unsigned *data)
{
    unsigned pos = (x + y * SIM_X_SIZE) * 3;
    data[pos] = color.r;
    data[pos + 1] = color.g;
    data[pos + 2] = color.b;

    return;
}

/* draw pixel in the window */
void drawPixel(unsigned x, unsigned y, color_t color)
{
    sf::RectangleShape figure(sf::Vector2f(SIZE_PIXEL, SIZE_PIXEL));
    figure.setFillColor(sf::Color(color.r, color.g, color.b));
    figure.setPosition(x * SIZE_PIXEL, y * SIZE_PIXEL);
    window.draw(figure);

    return;
}

/* to swap pointers to data arrays */
void swapData(unsigned **prev, unsigned **next)
{
    unsigned *tmp = *prev;
    *prev = *next;
    *next = tmp;

    return;
}

/* simulation flush */
void simFlush()
{
    window.clear();
    
    unsigned pos = 0;

    for (unsigned x = 0; x < SIM_X_SIZE; x++)
    {
        for (unsigned y = 0; y < SIM_Y_SIZE; y++)
        {
            pos = (x + y * SIM_X_SIZE) * 3;
            drawPixel(x, y, {next_gen[pos], next_gen[pos + 1], next_gen[pos + 2]});
        }
    }

    window.display();

    swapData(&prev_gen, &next_gen);

    return;
}

/* init window parameters */
void initWindow()
{
    window.create(sf::VideoMode(SIM_X_SIZE * SIZE_PIXEL, SIM_Y_SIZE * SIZE_PIXEL), "GAME OF LIFE");
    window.setPosition(sf::Vector2i(WIN_POS_X, WIN_POS_Y));
    window.setFramerateLimit(SIM_FRAME_LIMIT);

    return;
}

/* mainloop for simulation game */
void runGame()
{
    printf("_____START_GAME_of_LIFE_____\n");
    printf("PARAMETERS:\n");
    printf("\t-> SIM_X_SIZE = %d\n", SIM_X_SIZE);
    printf("\t-> SIM_Y_SIZE = %d\n", SIM_Y_SIZE);
    printf("\t-> SIM_FRAME_LIMIT = %d\n", SIM_FRAME_LIMIT);
    printf("\t-> SIZE_PIXEL = %d\n", SIZE_PIXEL);

    initWindow();

    while (window.isOpen())
    {
        sf::Event event;

        while (window.pollEvent(event))
        {
            if ((event.type == sf::Event::Closed) || (event.key.code == sf::Keyboard::Q))
                window.close();
        }

        app();
        simFlush();
    }
    printf("END GAME\n");

    return;
}
