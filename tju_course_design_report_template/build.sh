#!/usr/bin/env bash
# 在原项目中编译，并稳定目录、表格宽度与交叉引用。
set -e
cd "$(dirname "$0")"
if command -v latexmk >/dev/null 2>&1; then
    exec latexmk
fi
XELATEX="$(command -v xelatex || command -v xelatex.exe || true)"
if [ -z "$XELATEX" ] && [ -x /mnt/e/tools/latexStudy/miktex/bin/x64/xelatex.exe ]; then
    XELATEX=/mnt/e/tools/latexStudy/miktex/bin/x64/xelatex.exe
fi
if [ -z "$XELATEX" ]; then
    echo "找不到 xelatex，请安装 TeX Live / MiKTeX。" >&2
    exit 1
fi
mkdir -p build/body build/setup
CONVERTER="$(dirname "$XELATEX")/miktex-dvipdfmx.exe"
if [[ "$XELATEX" == *.exe ]] && [ -x "$CONVERTER" ]; then
    for pass in 1 2 3; do
        "$XELATEX" -no-pdf -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=build main.tex
    done
    "$CONVERTER" -z 1 -o build/main.pdf build/main.xdv
else
    for pass in 1 2 3; do
        "$XELATEX" -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=build main.tex
    done
fi
echo "完成：build/main.pdf"
