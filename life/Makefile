CXX = clang++
CXXFLAGS = -Wall -g -std=c++2a
LDFLAGS = -lSDL2

SOURCES = sim.cc app.cc

# SRC := $(addprefix $(SRCL)/, $(SOURCES))
# OBJECTS = $(SOURCES:.c=.o)
# OBJ := $(addprefix $(SRCL)/, $(OBJECTS))

PROG = life
RM = rm -rf

all: $(PROG)

$(PROG): $(SOURCES)
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $(PROG) $(LDFLAGS)

llvmIR: app.cc
	$(CXX) app.cc -o app.ll -S -emit-llvm -O2

clean:
	$(RM) $(PROG)
# 	$(RM) $(OBJ)
