#include "graphics_interface.h"
#include <SFML/Graphics.hpp>
#include "game.h"

unsigned data[SIM_DISPLAY_MEM_ADDR];

sf::RenderWindow window;

void simSetPixel(int x, int y, color_t color)
{
    int pos = (x + y * SIM_X_SIZE) * 3;
    data[pos] = color.r;
    data[pos + 1] = color.g;
    data[pos + 2] = color.b;
    return;
}

// void simFlush()
// {

// }

void initWindow()
{
    window.create(sf::VideoMode(SIM_X_SIZE, SIM_Y_SIZE), "GAME OF LIFE");
    window.setPosition(sf::Vector2i(10, 50));
    window.setFramerateLimit(SIM_FRAME_LIMIT);
    return;
}

void runGame()
{
    initWindow();

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

        window.clear();
        ifEnd = drawGame();
        // window.display();
        
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
