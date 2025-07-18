# Compiler settings
CXX = g++ -g 
EXE = bin/release/game.exe
SRC_DIR = src
INC_DIR = include
BUILD_DIR = build
ASSETS_DIR = assets

# SDL2 paths (update these to match your installation)
SDL2_PATH = C:/SDL2/SDL2-2.0.22/x86_64-w64-mingw32
# SDL2_IMAGE_PATH = C:/SDL2_image/SDL2_image-2.0.3/x86_64-w64-mingw32
# SDL2_MIXER_PATH = C:/SDL2_mixer/SDL2_mixer-2.8.1/x86_64-w64-mingw32
# SDL2_TTF_PATH = C:/SDL2_ttf/SDL2_ttf-2.24.0/x86_64-w64-mingw32

CXXFLAGS = -std=c++17 -Iinclude -IC:/SDL2/SDL2-2.0.22/x86_64-w64-mingw32/include/ -Wall -Wextra
           # -IC:/SDL2_image/SDL2_image-2.0.3/x86_64-w64-mingw32/include/SDL2 \
           # -IC:/SDL2_ttf/SDL2_ttf-2.24.0/x86_64-w64-mingw32/include/SDL2 \
           # -IC:/SDL2_mixer/SDL2_mixer-2.8.1/x86_64-w64-mingw32/include/SDL2 \
          

# Linker flags
LDFLAGS = -L$(SDL2_PATH)/lib 

# Libraries
LIBS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer

# Find all source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Targets
all: $(BUILD_DIR) $(EXE)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(EXE): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) -c $< -o $@ $(CXXFLAGS)

clean:
	@rm -rf $(BUILD_DIR) $(EXE)

run: $(EXE)
	@./$(EXE)

.PHONY: all clean run
