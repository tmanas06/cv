# Overleaf LaTeX CV Project for T Manas Chakravarty

This directory contains the exact, faithful LaTeX reconstruction of your 5-page CV ([`cv.pdf`](file:///Users/manas/Desktop/cv/cv.pdf)), ready to import and compile directly on **Overleaf**.

---

## 🚀 Quick Start on Overleaf

### Option 1: Direct Zip Upload (Recommended)
1. Log into your [Overleaf](https://www.overleaf.com) account.
2. Click **New Project** $\rightarrow$ **Upload Project**.
3. Drag and drop or select [`overleaf_project.zip`](file:///Users/manas/Desktop/cv/overleaf_project.zip) located in this folder.
4. Overleaf will automatically unpack all files (`main.tex` and the `images/` directory).
5. Click **Recompile** — your CV will build.

### Option 2: Copy-Paste `main.tex`
1. Create a **Blank Project** on Overleaf.
2. Paste the contents of [`main.tex`](file:///Users/manas/Desktop/cv/main.tex) into `main.tex`.
3. Create a folder named `images` in Overleaf and upload the badge image files from the local [`images/`](file:///Users/manas/Desktop/cv/images) folder.
4. Click **Recompile**.

---

## 💻 How to Run Locally on macOS

You can compile this CV locally using either **Homebrew (BasicTeX)** or **Docker**:

### Method 1: Using Homebrew & BasicTeX (Fastest, ~100MB download)
1. Install BasicTeX:
   ```bash
   brew install --cask basictex
   ```
2. Restart your terminal (or run `eval "$(/usr/libexec/path_helper)"`) so `pdflatex` and `tlmgr` are on your `PATH`.
3. Install the specific fonts and packages:
   ```bash
   sudo tlmgr update --self
   sudo tlmgr install charter fontawesome5 enumitem ragged2e
   ```
4. Compile your CV:
   ```bash
   ./compile.sh
   # or manually:
   pdflatex main.tex
   ```
5. View the output:
   ```bash
   open main.pdf
   ```

### Method 2: Using Docker (Zero TeX installation)
If you have Docker Desktop running:
```bash
docker run --rm -v "$PWD":/workdir -w /workdir danteev/texlive pdflatex main.tex
```
Or simply run `./compile.sh` with Docker Desktop open.

---

## 📁 Project Structure

| File / Folder | Description |
| :--- | :--- |
| [`main.tex`](file:///Users/manas/Desktop/cv/main.tex) | Main Overleaf LaTeX document with complete typography, sections, and exact content |
| [`cv.tex`](file:///Users/manas/Desktop/cv/cv.tex) | Identical duplicate of `main.tex` for convenience |
| [`images/`](file:///Users/manas/Desktop/cv/images) | High-resolution extracted certification badges (15 badges) |
| [`overleaf_project.zip`](file:///Users/manas/Desktop/cv/overleaf_project.zip) | Pre-packaged ZIP archive for 1-click Overleaf upload |
| [`cv.pdf`](file:///Users/manas/Desktop/cv/cv.pdf) | Original reference PDF |

---

## ⚙️ Features & Customization

1. **Exact Typography**: Uses `charter` (Bitstream Charter font) and `fontawesome5` matching the original document.
2. **Clickable Hyperlinks**: All links (GitHub, LinkedIn, Portfolio, Blog, Credly, EC-Council verify, project repos) are active via `hyperref` with `hidelinks` for a clean look.
3. **Badge Graphics Toggle**:
   - To show badges: `\showbadgestrue` (default).
   - To hide badges for an ultra-compact or text-only version: change to `\showbadgesfalse`.
4. **Natural or Fixed Page Breaks**:
   - Explicit `\newpage` commands ensure an identical 5-page layout matching [`cv.pdf`](file:///Users/manas/Desktop/cv/cv.pdf).
   - If you want the content to flow dynamically without forced page breaks, simply comment out the `\newpage` lines.
5. **Overleaf Compiler**: Compatible with the default **pdfLaTeX** compiler (no extra XeLaTeX or LuaLaTeX setup required).
