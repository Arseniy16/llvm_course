CXX = g++
CXXFLAGS = -Wall -g -std=c++2a
CXXFLAGS += -Iheaders

LDFLAGS += -lSDL2 #-lsfml-graphics -lsfml-window -lsfml-system 

# HEADL = #headers

# SRCL = #sources
SOURCES = sim.c app.c 
# SRC := $(addprefix $(SRCL)/, $(SOURCES))

# OBJECTS = $(SOURCES:.c=.o)
# OBJ := $(addprefix $(SRCL)/, $(OBJECTS))

PROG = life
RM = rm -rf

# $(SRCL)/%.o: $(SRCL)/%.c
# 	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: $(PROG)

# depend:
# 	$(CXX) $(CXXFLAGS) $(SRC) -MM > .depend

$(PROG): $(SOURCES)
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $(PROG) $(LDFLAGS)

# sfmlTest: test.c
# 	$(CXX) test.c -o sfml-app $(LDFLAGS)
# 	$(CXX) -c test.c $(CXXFLAGS) -o sfmlTest.o

clean:
	$(RM) $(PROG)
# 	$(RM) $(OBJ)

# -include .depend
