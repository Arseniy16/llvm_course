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

sfmlTest: test.c
	$(CXX) test.c -o sfml-app $(LDFLAGS)
# 	$(CXX) -c test.c $(CXXFLAGS) -o sfmlTest.o

# clean:
# 	$(RM) $(OBJ)
# 	$(RM) $(PROG)

-include .depend