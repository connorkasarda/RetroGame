# Compiler and Linker
COMPILER = nasm
LINKER = ld

# Directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include

# Files
SRC_FILES = $(wildcard $(SRC_DIR)/*.asm)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.asm, $(BUILD_DIR)/%.o, $(SRC_FILES))
TARGET = $(BUILD_DIR)/game

# Compiler flags
COMPILER_FLAGS = -f elf64 -I $(INCLUDE_DIR)/
LINKER_FLAGS = 

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJ_FILES)
	$(LINKER) $(LINKER_FLAGS) -o $@ $^

# Compiling
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm | $(BUILD_DIR)
	$(COMPILER) $(COMPILER_FLAGS) -o $@ $<

# Ensure build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean build directory
clean:
	rm -rf $(BUILD_DIR)

# Run the game
run:
	./$(TARGET)

.PHONY: all clean run
