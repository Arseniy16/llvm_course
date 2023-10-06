#include <SFML/Graphics.hpp>
#include "graphics_interface.h"
#include "game.h"

void dummy()
{
    sf::RenderWindow window;
    // sf::Window window;
    window.create(sf::VideoMode(800, 600), "GAME OF LIFE");
    window.setPosition(sf::Vector2i(10, 50));
    window.setFramerateLimit(4);

    while (window.isOpen())
    {
        // check all the window's events that were triggered since the last iteration of the loop
        sf::Event event;
        while (window.pollEvent(event))
        {
            // "close requested" event: we close the window
            if (event.type == sf::Event::Closed)
                window.close();
        }
    }

    return;
}

int main(int argc, char const *argv[])
{
    runGame();
    // dummy();
    return 0;
}