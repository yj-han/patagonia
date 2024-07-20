# Makefile for Patagonia Beamer theme

# Directories
SRC_DIR = src
BUILD_DIR = build
INSTALL_DIR = doc

# Find all .sty files in the src directory
STY_FILES = $(wildcard $(SRC_DIR)/*.sty)

# Your main presentation file (change this to your actual filename)
PRESENTATION = presentation

# LaTeX compiler
LATEX = pdflatex

# Default target
all: $(BUILD_DIR) copy_sty compile_presentation

# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Copy all .sty files to the build directory
copy_sty: $(BUILD_DIR)
	cp $(STY_FILES) $(BUILD_DIR)

# Compile the presentation
compile_presentation: copy_sty
	$(LATEX) -output-directory=$(BUILD_DIR) "$(PRESENTATION).tex"
	$(LATEX) -output-directory=$(BUILD_DIR) "$(PRESENTATION).tex"

# Install the document
install: compile_presentation
	mkdir -p $(INSTALL_DIR)
	cp "$(BUILD_DIR)/$(PRESENTATION).pdf" "$(INSTALL_DIR)/$(PRESENTATION).pdf"

# Clean up build files
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(INSTALL_DIR)

# Phony targets
.PHONY: all copy_sty compile_presentation install clean
