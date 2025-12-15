# Makefile for MkDocs project using uv

. PHONY: setup server build clean

# Virtual environment directory
VENV := .venv

# Create virtual environment and install dependencies
setup:
	uv venv $(VENV) --clear
	. $(VENV)/bin/activate && uv pip install -r requirements.txt

# Run MkDocs development server
server:
	. $(VENV)/bin/activate && mkdocs serve -w . 

# Build MkDocs documentation
build:
	. $(VENV)/bin/activate && mkdocs build

# Clean up virtual environment and build artifacts
clean:
	deactivate
	rm -rf $(VENV)
	rm -rf site