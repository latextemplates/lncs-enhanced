#!/usr/bin/env bash
# Renders the same content with the publisher's class as distributed (plain.tex) and with the
# preamble of paper.tex (ours.tex), and puts the first, a middle and the last page side by side:
# comparison-first.png, comparison-middle.png, comparison-last.png (left: as distributed, right: this template).
# Run from the directory of paper.tex: ./comparison/build.sh [pdf|png]
# Requires TeX Live (see Texlivefile), pdftoppm (poppler) and convert (ImageMagick) for the png step.
set -euo pipefail
cd "$(dirname "$0")/.."
step=${1:-all}

if [ "$step" = pdf ] || [ "$step" = all ]; then
  # ours.tex: the preamble of paper.tex up to \begin{document}, the shared body, and the bibliography block
  {
    sed -n '1,/^\\begin{document}$/p' paper.tex
    echo '\input{comparison/body}'
    sed -n '/^%%% Bibliography$/,/^\\end{document}$/p' paper.tex |
      sed '/^% Enforce empty line after bibliography$/,/^All links were last followed/d' # not part of the comparison
  } | sed 's/^\\begin{document}$/\\usepackage{lipsum}\n\\begin{document}/' > comparison/ours.tex # body.tex uses \lipsum
  latexmk -jobname=comparison-ours comparison/ours.tex
  # plain.tex as the publisher compiles it: pdflatex + bibtex
  latexmk -pdf -pdflatex='pdflatex %O %S' -bibtex -jobname=comparison-plain comparison/plain.tex
fi

if [ "$step" = png ] || [ "$step" = all ]; then
  for variant in plain ours; do
    pdftoppm -r 70 -png "comparison-$variant.pdf" "comparison/$variant"
  done
  # pdftoppm numbers pages with leading zeros when there are 10 or more; list them in order
  mapfile -t plain < <(ls comparison/plain-*.png | sort -V)
  mapfile -t ours < <(ls comparison/ours-*.png | sort -V)
  n=${#plain[@]}
  pick() { # $1: index into the page lists, $2: output name
    convert "${plain[$1]}" "${ours[$1]}" +append -bordercolor gray -border 1 "comparison-$2.png"
  }
  pick 0 first
  pick $(( (n - 1) / 2 )) middle
  pick $(( n - 1 )) last
  rm -f comparison/plain-*.png comparison/ours-*.png
fi
