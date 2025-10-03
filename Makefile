TEXFILE := LaTex-setup.tex
OUTPUT  := LaTex-setup.pdf
EXTRAFOLDERS := ./tex:./bst

.PHONY: all format build clean

all: format build clean

# Format silently, no backups or logs
format:
	@echo "Formatting $(TEXFILE)..."
	@latexindent -m -s -b=0 "LaTex-setup.tex" > /dev/null 2>&1

# Build silently, using extra folders for inputs
build:
	@echo "Building $(OUTPUT) silently..."
	@TEXINPUTS=$(EXTRAFOLDERS): latexmk -pdf -silent -pdflatex="pdflatex -interaction=nonstopmode" "$(TEXFILE)"

# Clean auxiliary files safely (keeps PDF)
clean:
	@echo "Cleaning LaTeX auxiliary files..."
	@latexmk -c "$(TEXFILE)"

