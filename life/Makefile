CXX = g++
CXXFLAGS = -Wall -g -std=c++2a
CXXFLAGS += -Iheaders

LDFLAGS += -lsfml-graphics -lsfml-window -lsfml-system 

HEADL = headers

SRCL = sources
SOURCES = game.c graphics_interface.c main.c 
SRC := $(addprefix $(SRCL)/, $(SOURCES))

OBJECTS = $(SOURCES:.c=.o)
OBJ := $(addprefix $(SRCL)/, $(OBJECTS))

PROG = life
# RM = rm -f -r

$(SRCL)/%.o: $(SRCL)/%.c
	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: $(PROG)

depend:
	$(CXX) $(CXXFLAGS) $(SRC) -MM > .depend

$(PROG): $(OBJ)
	$(CXX) $(CXXFLAGS) $(OBJ) -o $(PROG) $(LDFLAGS)

# sfmlWindow: sfmlTest.cpp
# 	$(CXX) -c sfmlTest.cpp $(CXXFLAGS) -o sfmlTest.o
# 	$(CXX) sfmlTest.o -o sfml-app $(LDFLAGS)

# clean:
# 	$(RM) $(OBJ)
# 	$(RM) $(PROG)

-include .depend