#include "graphics_interface.h"
#include <SFML/Graphics.hpp>
#include "game.h"
#include <stdio.h>
#include <unistd.h>

unsigned data[SIM_DISPLAY_MEM_ADDR];

sf::RenderWindow window;

void simSetPixel(unsigned x, unsigned y, color_t color)
{
    unsigned pos = (x + y * SIM_X_SIZE) * 3;
    data[pos] = color.r;
    data[pos + 1] = color.g;
    data[pos + 2] = color.b;

    // sf::RectangleShape figure(sf::Vector2f(SIZE_PIXEL, SIZE_PIXEL));
    // // sf::CircleShape figure(SIZE_PIXEL/2);
    // figure.setFillColor(sf::Color(color.r, color.g, color.b));
    // figure.setPosition(x * SIZE_PIXEL, y * SIZE_PIXEL);
    // window.draw(figure);
    
    return;
}

void drawPixel(unsigned x, unsigned y, color_t color)
{
    // sf::RectangleShape rectangle(sf::Vector2i(50, 50));
    sf::RectangleShape figure(sf::Vector2f(SIZE_PIXEL, SIZE_PIXEL));
    // sf::CircleShape figure(SIZE_PIXEL/2);
    figure.setFillColor(sf::Color(color.r, color.g, color.b));
    figure.setPosition(x * SIZE_PIXEL, y * SIZE_PIXEL);
    window.draw(figure);
    // window.display();
}

void simFlush(color_t color)
{
    // window.clear(sf::Color(color.r, color.g, color.b));
    window.clear();
    
    unsigned pos = 0;

    for (unsigned x = 0; x < SIM_X_SIZE; x++)
        for (unsigned y = 0; y < SIM_Y_SIZE; y++)
        {
            pos = (x + y * SIM_X_SIZE) * 3;
            drawPixel(x, y, {data[pos], data[pos + 1], data[pos + 2]});
        }
    // window.clear( sf::Color::Green );
    // drawGame();
    window.display();
    return;
}

void initWindow()
{
    printf("hi\n");
    window.create(sf::VideoMode(SIM_X_SIZE * SIZE_PIXEL, SIM_Y_SIZE * SIZE_PIXEL), "GAME OF LIFE");
    window.setPosition(sf::Vector2i(WIN_POS_X, WIN_POS_Y));
    window.setFramerateLimit(SIM_FRAME_LIMIT);

    return;
}

// void runGame(sf::RenderWindow *window)
void runGame()
{
    printf("hello\n");
    initWindow();
    initGame();
    window.display();

    while (window.isOpen())
    {
        sf::Event event;
        int ifEnd = 0;

        while (window.pollEvent(event))
        {
            if ((event.type == sf::Event::Closed) || (event.key.code == sf::Keyboard::Q))
                window.close();

            // if (!ifEnd)
            // {
            //     if (event.type == sf::Event::KeyPressed)
            //         keyHandlerFunc(Option::adaptKey(event.key.code));
            // }
        }

        // window.clear(sf::Color(color.r, color.g, color.b));
        // window.clear( sf::Color::Green );
        ifEnd = drawGame();
        // window.display();
        // sleep(5);
  
        // if (ifEnd)
        // {
        //     drawLost();
        //     window.display();
        //     sleep(2);
        //     window.close();
        // }  
    }
    return;

}
