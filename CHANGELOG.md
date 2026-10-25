# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).
From 2022-03-01 onwards, versioning is done using [Calendar Versioning](https://calver.org/).

## [Unreleased]

### Added

- LuaLaTeX: [linebreaker](https://ctan.org/pkg/linebreaker) sets a paragraph again with more tolerance when a line would run into the margin.
- README: "Further information" links common questions of LaTeX beginners (often referenced questions on TeX.SE, Barbara Beeton's "What every LaTeX newbie should know").
- README FAQ: how to remove comments and unused files before uploading to arXiv ([arxiv-latex-cleaner](https://github.com/google-research/arxiv-latex-cleaner)).
- Commented-out progress bars: uncomment the lines in the preamble and use `\progress{60}` below a heading to see how far a section is written.
- `.devcontainer/devcontainer.json`: open the repository in VS Code ("Reopen in Container") or in GitHub Codespaces to work inside the TeX Live image, without a local LaTeX installation.
- "Further information" links the [LaTeX setup guide](https://github.com/latextemplates/scientific-thesis-template/blob/main/docs/latex-setup.md) for installing LaTeX and an editor.

### Changed

- LuaLaTeX: widows and orphans are removed by [lua-widow-control](https://ctan.org/pkg/lua-widow-control), which keeps pages full by lengthening or shortening a paragraph by one line; pdfLaTeX keeps [nowidow](https://ctan.org/pkg/nowidow).
- Long URLs may break after any character ([xurl](https://ctan.org/pkg/xurl)), so they no longer run into the margin.
- The README recommends the [JabRef beta version](https://github.com/JabRef/jabref/releases), because the stable version 5.15 is too old.

### Removed

- The switched-off [spelling](https://ctan.org/pkg/spelling) package is no longer loaded.

## [2026-10-19]

### Added

- A section written in plain Markdown (`content-markdown.md`, German: `content-markdown.de.md`; LuaLaTeX).
- VS Code: [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) recommended, configured by `.markdownlint.yml`.
- VS Code: LTeX+ knows the words of the aspell word lists (`.vscode/ltex.dictionary.<language>.txt`).
- `make dictionaries` merges the word lists of aspell, LTeX+, and TeXtidote.
- CI: after a push that changes a word list, the workflow `Dictionaries` runs `make dictionaries` and commits the merged word lists.
- CI: [typos](https://github.com/crate-ci/typos) checks the spelling, also in comments (configured in `.typos.toml`).

### Changed

- `paper.tex` keeps the caption style of the document class, as `paper-basic-listings.tex` does (the `caption` package is no longer loaded).
- The caption of the cross-reference example table is above the table.
- Lines in minted listings are labeled with `\label` and referenced with `\zcref` like everything else (`\labelline` and `\refline` removed).
- Markdown example: "a whole section" instead of "a longer part".
- CI: aspell, textlint, and TeXtidote also check the Markdown files.
- CI and `make spellcheck`: aspell and TeXtidote run in the [Docker image by DANTE e.V.](https://hub.docker.com/r/danteev/texlive).
- README.md: FAQ on adding words (e.g., names of tools) to the spell checkers.
- README.md: how to run the `make` targets in Docker without a local `make`.
- README.md: "Disabled features" is a subsection of "Benefits".
- README.md: markdownlint findings fixed.

### Removed

- Outdated copy of the CI workflow `check.yml` in the root directory (CI uses `.github/workflows/check.yml`).
- `paper.spell.good`: word list of a former spell check, no longer used.

### Fixed

- Typos fixed, mostly in comments; German comments in the English files translated.

## [2026-10-16]

### Added

- [TeXtidote](https://github.com/sylvainhalle/textidote) checks spelling, grammar, and style (configuration `.textidote`, `make spellcheck-textidote`), for English documents in CI.
- VS Code: [JabRef 4 VSCode](https://marketplace.visualstudio.com/items?itemName=jabref.jabref-4-vscode) recommended.

### Changed

- `paper*.tex` use minted; the variants using the listings package are `paper*-basic-listings*.tex`.
- README.md: minted FAQs merged and moved up.
- `make spellcheck` runs all spell checkers (`make aspell` is now `make spellcheck-aspell`).
- GitHub workflows: actions pinned to commit SHAs.

### Fixed

- Example texts: spelling and grammar fixed.
- Makefile: `.PHONY` lists all targets; `make spellcheck-aspell` and `make showundef` work.

## [2026-10-15]

### Added

- The LaTeX hints show how to color table rows and cells (`\rowcolor`, `\cellcolor`). [scientific-thesis-template#87](https://github.com/latextemplates/scientific-thesis-template/pull/87)
- `make log` shows the relevant messages of the LaTeX log (texlogsieve).
- `paper.tex` shows how to produce a self-archiving version (`authorarchive`, commented out).

### Changed

- `make format` (and thus CI) indents all main files (`paper*.tex`), not only `MASTER_TEX`.
- VS Code: the recommended extension is `james-yu.latex-workshop` (`manhen.latex-workshop-2` was removed from the stores).
- VS Code: the background of the PDF viewer follows the light or dark theme.
- Dependabot groups all GitHub Actions updates into one weekly PR.
- `check.yml` pins all GitHub Actions to commit SHAs.
- README.md: sections reordered.
- README.md: on Overleaf, select TeX Live 2026.
- README.md: passages in another language are an FAQ.
- README.md: links the decision records of the template generator.
- README.md: "Usage with docker" merged into "Docker-based (recommended)".
- Embedding the `.bib` file into the PDF is opt-in.
- `.latexmkrc` replaces `_latexmkrc`; it works on Overleaf, too.
- `make` runs the LaTeX tools in the Docker image (`make LOCAL=1` runs them locally).
- `vscode.settings.json` contains the Docker settings of LaTeX Workshop and does not build on save.
- README.md: compilation hints consolidated in "LaTeX compilation".
- minted compiles without `--shell-escape`.

### Fixed

- The README links the `figures/` directory, and `.dockerignore` excludes the generated `figures/*.pdf_tex` files. [generator-latex-template#586](https://github.com/latextemplates/generator-latex-template/pull/586)
- The `.markdown.in` file of the markdown package is ignored by git and removed by `latexmk -c`.
- README.md: the download link points to this repository.
- textlint ignores expl3 function names, Markdown reference IDs, and the name of the markdown package.
- German documents load only `autotype` (not additionally `selnolig`) for correct ligatures.
- `make view` opens the PDF on Linux and macOS.
- German documents configure `autotype` with `ligatures=selective` instead of the outdated `ligbreak`.
- README.md: the self-archiving FAQ points to the example in `paper.tex`.
- `vscode.settings.json`: the recipes run `lualatex` (resp. `pdflatex`) with the right bibliography tool.

## [2026-10-14]

### Added

- The LaTeX hints show how to write text in Markdown using the [markdown](https://ctan.org/pkg/markdown) package - easing the start for LaTeX newcomers. The example is shown when compiling with LuaLaTeX; with pdfLaTeX, a hint is shown instead. The package's cache directory (`_markdown_*/`) is ignored by git. Markdown references such as `<#tbl:markdown>` typeset the type name and the number ("Table 1").
- The header of the main file states in which lines `\begin{document}` and the first heading are, so the content is found without scrolling through the long preamble.

### Changed

- The README uses the TeX Live image of the Island of TeX directly (also in the VS Code setting `latex-workshop.docker.image.latex`) - building an own image `ltg` is no longer needed. The commands to compile in the container are copy-and-paste ready for Windows (PowerShell and Command Prompt), Linux, and macOS.
- The README's tool hints distinguish a Docker-based setup (recommended) from a traditional installation: the [TeX Live image by the Island of TeX](https://gitlab.com/islandoftex/images/texlive) works the same on Windows, macOS, and Linux and makes `minted` work without a separate Python setup. The "Usage with docker" section and the VS Code hints (LaTeX Workshop can compile in the container) are linked from there.

## [2026-10-08]

### Added

- The `Check` workflow has a `textlint` job that reports weakening words (e.g., "clearly", "just") in the English `.tex` files as annotations, without failing the build ("only" is allowed). Configure it in `.textlintrc.json`; the README shows how to run it locally.
- The figure examples show how to include a JPEG photo (`figures/ulm-minster.jpg`, CC0 from Wikimedia Commons).
- The "Related Work" section points to [ScienceOS](https://www.scienceos.ai/) (EU-hosted) for searching related work and to writing hints in [Student Thesis Projects](https://vdf.ch/product/student-thesis-projects-en.html) and [Writing for Computer Science](https://doi.org/10.1007/978-1-4471-6639-9); each title is a clickable link, and its URL is also given in a footnote.

### Changed

- Cross-references use [zref-clever](https://ctan.org/pkg/zref-clever) instead of [cleveref](https://ctan.org/pkg/cleveref), because zref-clever works with tagged (accessible) PDFs: write `\zcref{...}` instead of `\cref` and, at the start of a sentence, `\Zcref{...}` (short for `\zcref[S]{...}`) instead of `\Cref`.
- `_latexmkrc` is organized in sections and lists commented-out alternatives for continuous preview (`-pvc`), the job name, and the PDF viewer (e.g., evince).
- The example and paper-structure texts avoid words that textlint's `write-good` rule flags (`Finally`, `rarely`, `a few`, `just`, `several`), so a fresh paper has no textlint annotations. A sentence-initial `Finally,` is allowed in `.textlintrc.json`, because it marks a sequence rather than weakening a statement.
- The paragraph example links Andrew Stacey's *Document Revision System* by title with the URL in a footnote, and the hyphenation example shows the short `\verb` snippets `\allowbreak{}` and `"=` instead of whole words, so that neither runs out of a narrow column.

### Fixed

- Long code lines without spaces (e.g., `\includegraphics[width=.4\linewidth]{example-image-a}`) in the "Corresponding LaTeX code" boxes of the `listings` variant are wrapped instead of running out of the box.
- Fixed typos in the example and writing-hint texts.
- `latexmk -pv` opens the PDF on Linux and macOS: the SumatraPDF viewer is only configured on Windows.

## [2026-07-30]

### Added

- The Overleaf note now states the template is based on TeX Live 2025 (was 2024), matching Overleaf's current TeX Live.
- The README now links the [latex-snippets site](https://latextemplates.github.io/latex-snippets/) near the top, so you can inspect the source snippets this template is assembled from.
- Soft-wrapped lines in code listings now show a gray hook arrow (↪) at the start of each continuation line, so they are distinguishable from real line breaks; the arrow is not copied when you select the code from the PDF.
- The "Examples" section with the rendered example-PDF links now appears right below the title, before "Usage", so you see the output first.
- Opt-in rectangular ("block") paragraphs: uncomment `\rectangularparagraphstrue` in the preamble to stretch every paragraph's last line to the full column width (off by default; see the comment in `paper.tex` for the copy-fitting trade-off).
- LuaLaTeX builds avoid a lone short word as the last line of a paragraph (`impnattypo` with its `lastparline` feature; pdfLaTeX builds are unaffected). [lncs-enhanced#16](https://github.com/latextemplates/lncs-enhanced/issues/16)
- The example content demonstrates the theorem-like environments of the `llncs` class (`definition`, `proposition`, `lemma`, `theorem`, `proof`, `corollary`, `example`) with a displayed, referenced equation -- the paper example now covers what the retired upstream `llncs.dem` demonstration showed. [#29](https://github.com/latextemplates/lncs-enhanced/issues/29)
- The README documents biblatex support (`--bibtextool=biblatex`, using the `biblatex-lncs` style) and the new `--authoryear` generator switch for author-year citations, answering the long-standing `citeauthoryear` question. [#23](https://github.com/latextemplates/lncs-enhanced/issues/23) [#3](https://github.com/latextemplates/lncs-enhanced/issues/3)
- The compiled PDF now embeds `paper.bib`, so the reference data can be extracted from the PDF (e.g., with JabRef).

### Fixed

- The README links for the original LNCS demonstration and documentation (`llncs-dem.pdf`, `llncs-doc.pdf`) were dead: the documentation now points to the CTAN-hosted `llncsdoc.pdf`; the `llncs.dem` demonstration is no longer distributed, so the README points to `samplepaper.tex` in Springer's proceedings-templates zip instead. [#29](https://github.com/latextemplates/lncs-enhanced/issues/29)
- arXiv uploads no longer fail with "! I can't find file `clmr28t10+20`": `paper.tex` now starts with `\ifdefined\pdfoutput\pdfoutput=1\fi`, which makes arXiv use `pdflatex` instead of DVI-producing `latex`. See the README section "Final submission". [lncs-enhanced#44](https://github.com/latextemplates/lncs-enhanced/issues/44)

## [2026-06-30]

### Added

- Inline acronym typesetting with `\initialism` (and the ready-made `\OMG`, `\BPEL`, `\BPMN`, `\UML`) now works — the required `lccaps` package is now loaded — demonstrated by a new example in the "LaTeX Hints" chapter.

### Fixed

- The generated German aspell dictionary (`.aspell.de.pws`) is now tagged as language `de` (was `en`), fixing the CI spell-check for the German paper variants.

## [2026-06-25]

### Added

- New example sections in the "LaTeX Hints" chapter: Formulas and Equations, Figures with TikZ, Plots with pgfplots, and tables spanning multiple pages (`longtable`).

## [2025-04-11]

### Added

- Added support to use `lualatex-dev`.
- Added more words to personal aspell dictionary.
- Added support for TeXLive 2025.

### Fixed

- Fixed utf-8 marking in generated `.aspell-en.pws`.

## Removed

- Removed support for TeXLive 2023.

## [2025-03-04]

### Changed

- Updated [zauguin/install-texlive](https://github.com/zauguin/install-texlive) to `v4`.

## [2025-02-12]

### Fixed

- `pdflatex` run works again if both lualatex and pdflatex are used.

## [2025-01-31]

### Changed

- Renamed to `lncs-enhanced` to show that it is an enhanced version of the [Document class and bibliography style for Lecture Notes in Computer Science (LNCS)](https://ctan.org/pkg/llncs)

### Added

- Added `commands.tex` to collects all LaTeX macros / commands for a better overview on available (custom) LaTeX commands.

## [2025-01-25]

### Added

- Added [TeXcount](https://app.uio.no/ifi/texcount/index.html) to GitHub workflow summary.
- GitHub workflow job summary for `latexmk` generated using [texlogsieve](https://ctan.org/pkg/texlogsieve).

### Changed

- Renamed `.tex` files in repository to match `.pdf` filenames linked in `README.md`
- Refined `README.md`
- Refined `.gitignore`
- Formatting improvements in German examples

## [2025-01-20]

### Added

- Added `.aspell.en.pws` and `.aspell.conf` to ignore some LaTeX commands at aspell.
- Added `latexindent` to GitHub actions (`check.yml`).
- When using lualatex: Added support for [spelling](https://www.ctan.org/pkg/spelling) package (which highlights bad spellings in red - if `.spell.bad` containing misspelled words exists)

### Fixed

- Fixed tag for iot Docker image.

### Changed

- Refined `Makefile`

## [2025-01-14]

### Changed

- Compilation with both lualatex and pdflatex is possible. Defaults to lualatex.
- Nicer gray scale for `minted` listings.
- `Dockerfile` switched to [Island of TeX's docker image](https://gitlab.com/islandoftex/images/texlive#tex-live-docker-image) to enable easy addition of new LaTeX packages.

## [2022-06-06]

### Added

- Magic comment for [LTeX](https://github.com/valentjn/vscode-ltex#ltex-extension-for-vs-code-grammarspell-checker-using-languagetool-with-support-for-latex-markdown-and-others) (because of [vscode-ltex#632](https://github.com/valentjn/vscode-ltex/issues/632))

### Changed

- Refined description of usage of [llncsconf](https://ctan.org/pkg/llncsconf) package.
- Update `splncsnat` to [splncs04nat](https://github.com/tpavlic/splncs04nat). [lncs#35](https://github.com/latextemplates/lncs-enhanced/issues/35)
- `_latexmkrc` is available instead of `latexmkrc` to ease usage at overleaf. [lncs#40](https://github.com/latextemplates/lncs-enhanced/issues/40)

### Fixed

- Correct `\keywords{}` syntax for LCNS. [lncs#39](https://github.com/latextemplates/lncs-enhanced/issues/39)
- Fixed line break in introduction

## [2022-03-01]

### Changed

- LNCS is now based on the official CTAN package [llncs](https://ctan.org/pkg/llncs).
- Now generated using the [latex template generator](https://www.npmjs.com/package/generator-latex-template).
- Replaced `\ifluatex` statements by separate `.tex` documents. This makes each `.tex` document smaller and simpler to understand.
- Quoting is done with <code>``...''</code> instead of `\qq{...}`
- Updated to TeXLive 2021

### Added

- Added initial `Dockerfile` to enable building using Docker.
- Added package [mindflow](https://www.ctan.org/pkg/mindflow), which supports quickly noting down thoughts with a) a proper rendering of LaTeX and b) a proper differentiation from the main text
- Enable deletion of `*.bbl` when calling `latexmk -c`
- Added explicit `LICENSE`: [0BSD](https://opensource.org/licenses/0BSD)
- Added more LaTeX hints

### Fixed

- Examples now also work on overleaf. `\currfile` now correctly returns `main.tex`/`paper.tex` instead of `output.tex`.

## [1.9.1] – 2019-02-04

### Fixed

- Fixed compatibility with recent babel versions: using `main=english` as package parameter.

## [1.9.0] – 2018-07-18

### Added

- Added explanation how to use this class for German papers.
- Added a fix for using the babel package.
  See <https://tex.stackexchange.com/q/441670/9075> for details.

### Changed

- Minimum required `llncs.cls` file: 2018/03/10.

## [1.8.0] – 2018-05-09

### Added

- Added [stfloats](https://ctan.org/pkg/stfloats) package to enable footnotes appearing after floats.
- Added option `babel` to microtype package to ensure that documents written in a language other than English also work.
- Added package [siunitx](https://ctan.org/pkg/siunitx) including an example.

### Changed

- Refined `README.md`.

### Fixed

- Numbers can be copied. Enabled by switching from [cmap](https://www.ctan.org/pkg/cmap) to `glyphtounicode`. Fixes [#22](https://github.com/latextemplates/lncs-enhanced/issues/22).

### Removed

- Removed building of `llncs.dem` and `llncs.doc` from CircleCI script, because these files are not distributed by Springer anymore.

## [1.7.0] – 2018-03-10

### Added

- Support for [lualatex](https://www.luatex.org/) as compiler.
  When using "Times New Roman" due to space limitations, the font of the code is still "Latin Modern" in the case of lualatex.

### Fixed

- The font size of the bibliography is fixed.

### Changed

- The monospaced font is not variable any more.

## [1.6.1] – 2018-03-08

### Fixed

- Changed minimum requirement regarding version of `llncs.cls` to `2017/09/04` (version 2.19).
- Fix multiply defined label L2.

## [1.6.0] – 2018-03-07

### Changed

- Separated minted support to separate file `paper-minted.tex`.
- Changed minted style from friendly to bw.

### Added

- Added "aboveskip" and "belowskip" hints.
- Added example Java listing using minted.
- Added example XML listing using listings.

### Fixed

- The example listing is now floating. Otherwise, the listing flows from one page to the next and interrupted by a floating table.

## [1.5.0] – 2018-02-04

### Changed

- Ligatures are disabled for monospaced font. E.g., \texttt{--} stays `--` and is not converted to an en dash.
- Replace `splncs03.bst` by `splncsnat.bst`, which was [developed in a clean way](https://phaseportrait.blogspot.de/2011/02/natbib-compatible-bibtex-style-bst-file.html) by [@tpavlic](https://github.com/tpavlic).

### Added

- Example for `\citet` (enabled by `splncsnat.bst`).

## [1.4.1] – 2018-02-03

### Fixed

- Numbers in the bibliography are rendered as LNCS required again.

## [1.4.0] – 2018-02-02

### Added

- Support for `\cite[prenote][postnote]{ref}` to enable `\cite[based on][]{ref}` by including the [natib](https://www.ctan.org/pkg/natbib) package.
- Support for [booktabs](https://ctan.org/pkg/booktabs) package.

### Changed

- Removed `tracking=smallcaps` option in microtype to have letters in `\textsc{BPMN}` standing closer together.

## [1.3.0] – 2018-01-30

### Added

- Added ready-to-go configuration for [latexindent](https://ctan.org/pkg/latexindent).
- Added labeled "Conclusion and Outlook" section to enable an even quicker start.
- Added prepared usage of [llncsconf](https://github.com/adbrucker/llncsconf) package.
- Explicitly added package [hyperref](https://ctan.org/pkg/hyperref) to `paper.tex` in case users remove the `pdfcomment` package.

## [1.2.0] – 2018-01-19

### Added

- Added package [upquote](https://www.ctan.org/pkg/upquote) to enable backticks being properly rendered in listings.

### Fixed

- Listings by the packages minted and listings can be mixed now: The counter of "List." at the captions were different.

### Changed

- Replaced the outdated [mathptmx](https://ctan.org/pkg/mathptmx) by the [newtx](https://ctan.org/pkg/newtx) and [newtxtt](https://ctan.org/pkg/newtxtt) packages.
  Explained their activation (space saving technique).
- Blindtext now also in the conclusion.

## [1.1.1] – 2018-01-18

### Changed

- `download-llncs-files-from-springer.sh` now uses <ftp://ftp.springernature.com/cs-proceeding/llncs/llncs2e.zip> as `ftp.springer.de` seems to be an unofficial site.
- Removed download of required Springer files using gradle.
- Updated `README.md`: Merged "Features" and "Benefits" into "Features".

## [1.1.0] – 2018-01-17

### Added

- Added example `lstlisting` to show how the [listings](https://www.ctan.org/pkg/listings) package can be used.
- Added example listing typeset using [minted](https://github.com/gpoore/minted).
- Added `\usepackage[utf8]{inputenc}` to support input of non-ASCII characters using UTF-8.
- Added TeX magic comments.

### Changed

- Tweaked options for "microtype", especially `protrusion=alltext-nott`.

## [1.0.0] – 2018-01-16

First release using semantic versioning.

[Unreleased]: https://github.com/latextemplates/lncs-enhanced/compare/2026-10-19...HEAD
[2026-10-19]: https://github.com/latextemplates/lncs-enhanced/compare/2026-10-16...2026-10-19
[2026-10-16]: https://github.com/latextemplates/lncs-enhanced/compare/2026-10-15...2026-10-16
[2026-10-15]: https://github.com/latextemplates/lncs-enhanced/compare/2026-10-14...2026-10-15
[2026-10-14]: https://github.com/latextemplates/lncs-enhanced/compare/2026-10-08...2026-10-14
[2026-10-08]: https://github.com/latextemplates/lncs-enhanced/compare/2026-07-30...2026-10-08
[2026-07-30]: https://github.com/latextemplates/lncs-enhanced/compare/2026-06-30...2026-07-30
[2026-06-30]: https://github.com/latextemplates/lncs-enhanced/compare/2026-06-25...2026-06-30
[2026-06-25]: https://github.com/latextemplates/lncs-enhanced/compare/2025-04-11...2026-06-25
[2025-04-11]: https://github.com/latextemplates/lncs-enhanced/compare/2025-03-04...2025-04-11
[2025-03-04]: https://github.com/latextemplates/lncs-enhanced/compare/2025-02-12...2025-03-04
[2025-02-12]: https://github.com/latextemplates/lncs-enhanced/compare/2025-01-31...2025-02-12
[2025-01-31]: https://github.com/latextemplates/lncs-enhanced/compare/2025-01-25...2025-01-31
[2025-01-25]: https://github.com/latextemplates/lncs-enhanced/compare/2025-01-20...2025-01-25
[2025-01-20]: https://github.com/latextemplates/lncs-enhanced/compare/2025-01-14...2025-01-20
[2025-01-14]: https://github.com/latextemplates/lncs-enhanced/compare/2022-06-06...2025-01-14
[2022-06-06]: https://github.com/latextemplates/lncs-enhanced/compare/2022-03-01...2022-06-06
[2022-03-01]: https://github.com/latextemplates/lncs-enhanced/compare/1.9.1...2022-03-01
[1.9.1]: https://github.com/latextemplates/lncs-enhanced/compare/1.9.0...1.9.1
[1.9.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.8.0...1.9.0
[1.8.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.7.0...1.8.0
[1.7.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.6.1...1.7.0
[1.6.1]: https://github.com/latextemplates/lncs-enhanced/compare/1.6.0...1.6.1
[1.6.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.5.0...1.6.0
[1.5.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.4.1...1.5.0
[1.4.1]: https://github.com/latextemplates/lncs-enhanced/compare/1.4.0...1.4.1
[1.4.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.3.0...1.4.0
[1.3.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.1.1...1.2.0
[1.1.1]: https://github.com/latextemplates/lncs-enhanced/compare/1.1.0...1.1.1
[1.1.0]: https://github.com/latextemplates/lncs-enhanced/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/latextemplates/lncs-enhanced/releases/tag/1.0.0

<!-- markdownlint-disable-file MD013 MD024 CHANGELOG-RULE-003 -->
