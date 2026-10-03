#!/usr/bin/env bash
set -e

# Add standard MacTeX / BasicTeX paths to PATH if present
export PATH="/Library/TeX/texbin:/usr/local/texlive/current/bin/universal-darwin:/usr/local/bin:/opt/homebrew/bin:$PATH"

TARGET="main.tex"
OUTPUT="main.pdf"

echo "==========================================="
echo " Compiling CV Locally"
echo "==========================================="

if command -v pdflatex >/dev/null 2>&1; then
    echo "Found pdflatex: $(which pdflatex)"
    echo "Running pass 1..."
    pdflatex -interaction=nonstopmode "$TARGET" > /dev/null
    echo "Running pass 2 (resolving labels)..."
    pdflatex -interaction=nonstopmode "$TARGET" > /dev/null
    echo ""
    echo "SUCCESS: $OUTPUT generated successfully!"
    echo "Open with: open $OUTPUT"
    exit 0
fi

# Check Docker if pdflatex is not installed
if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    echo "pdflatex not found on host, but Docker is running!"
    echo "Compiling inside lightweight Docker container..."
    docker run --rm -v "$PWD":/workdir -w /workdir danteev/texlive pdflatex "$TARGET"
    echo ""
    echo "SUCCESS: $OUTPUT generated via Docker!"
    echo "Open with: open $OUTPUT"
    exit 0
fi

echo "ERROR: Neither 'pdflatex' nor an active Docker daemon was found."
echo ""
echo "Quick 1-step installation on macOS (via Homebrew):"
echo "  brew install --cask basictex"
echo "  sudo tlmgr update --self"
echo "  sudo tlmgr install charter fontawesome5 enumitem ragged2e"
echo ""
echo "Or start Docker Desktop and run this script again!"
exit 1
