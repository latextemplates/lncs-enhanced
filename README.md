# Enhanced LNCS Template

> Quick start for modern LaTeXing with [LNCS](http://www.springer.com/computer/lncs).

This template is made for TeX Live 2026.
On Overleaf, select TeX Live 2026 in the project settings (Menu → Settings → Compiler → TeX Live version).

The LaTeX snippets this template is assembled from can be inspected at <https://latextemplates.github.io/latex-snippets/>.

## Examples

- [paper.pdf](https://latextemplates.github.io/lncs-enhanced/paper.pdf) - normal paper.
- [paper-minted.pdf](https://latextemplates.github.io/lncs-enhanced/paper-minted.pdf) - paper showing minted in action.
- [paper-newtx.pdf](http://latextemplates.github.io/lncs-enhanced/paper-newtx.pdf) - paper typeset in Times Roman to save some space.
- [paper-minted-newtx.pdf](http://latextemplates.github.io/lncs-enhanced/paper-minted-newtx.pdf) - paper typeset in Times Roman to save some space.

## Quick start

- Click on `Download ZIP` or [here](https://github.com/latextemplates/lncs-enhanced/archive/main.zip).
- Extract `lncs-enhanced-main.zip` in the folder where you want to write your paper.
- Edit [`paper.tex`](paper.tex).
- Compile with "lualatex + bibtex" in your TeX editor or with `latexmk paper` / `make` on the command line.

As you see on GitHub actions, the paper compiles out of the box.
There is no need to adjust the packages or to remove some of them.
This might lead to undesired results such as hyperlinks not working any more or no good microtypographic features.
In case you think, a package needs to be altered or added, feel free to open an issue.

## Benefits

Following features are enabled in this template:

- Provides a skeletal [paper.tex](paper.tex) file
- Example to have an image being placed right to a text
- Support for German documents (without broken headers):
  Contains a fix to increase compatibility with Babel.
  See <https://tex.stackexchange.com/a/441701/9075> for details.
- Automatic setting of "Fig." and "Section"/"Sect." according to the LNCS style.
  Just use `\Zcref{sec:xy}` at the beginning of a sentence and `\zcref{sec:xy}` in the middle of a sentence.
  Thanx to [zref-clever].
- Sharper font (still compatible with Springer's requirements).
- (Optional) Typesetting of listings using advanced highlighting powered by the [minted] package.
  `minted` provides better output than [listings], but requires [latexminted] to be installed.
- Generated PDF allows for copy and paste of text without getting words with [ligatures](https://en.wikipedia.org/wiki/Typographic_ligature) such as "workflow" destroyed.
  With pdfLaTeX, this is enabled by `glyphtounicode`, which encodes ligatures (such as fl) using unicode characters; LuaLaTeX does this by itself.
- Ligatures are removed if they are typeset at the wrong place.
  This is enabled by the [selnolig](https://tex.meta.stackexchange.com/questions/2884/new-package-selnolig-that-automates-suppression-of-typographic-ligatures) package.
- Support of hyperlinked references without extra color thanx to [hyperref].
- Better breaking of long URLs.
- Support for `\powerset` command.
- (Optional) Support todos as pdf annotations. This is enabled by the [pdfcomment] package.
- [microtypographic extensions](https://www.ctan.org/pkg/microtype) for a better look of the paper.
- Modern packages such as [microtype], [zref-clever], [csquotes], [hyperref], [hypcap], [upquote], [natbib], [booktabs].
- (Optional) LaTeX compilation using the modern [lualatex] compiler.
  For older systems, [pdflatex](https://en.wikipedia.org/wiki/PdfTeX) is still supported.
- [latexmk] for easy compilation of the LaTeX document.
- Ready-to-go configuration for [latexindent].
- Proper hyphenation and microtype for English texts.

## Disabled features

Following features were not activated for this template.
You can run the [latex template generator] to enable the features.

Hints on writing an abstract and thesis by Dirk Fahland.

Besides the default BibTeX setup (natbib + `splncs04nat`), biblatex is supported: generate with `--bibtextool=biblatex` to use the [biblatex-lncs](https://ctan.org/pkg/biblatex-lncs) style (numeric, mimicking Springer's `splncs04` look, processed with biber).

For **author-year citations** (this template's answer to `llncs`'s `citeauthoryear` option, whose Springer `.bst` files are not part of TeX Live), generate with `--authoryear=true`: this switches to biblatex with the `authoryear` style, so `\citep{key}` renders as "(Author, year)" and `\citet{key}` as "Author (year)".

## Contained directories and files

### Directories

- [figures](figures/) Directory containing the figures.
  By using LuaLaTex/PDFLaTeX it is possible to use PDFs, JPGs, PNGs, ... We recommend to use PDFs to enable smooth scaling.

### Files

- `paper.tex` - The main `.tex` file loading all LaTeX packages and their configurations.
  - Add text here
  - Adjust title etc. here
- [bibliography.bib](bibliography.bib) - Bibliography. [biblatex] format. Manage it with [JabRef].
- [abbreviations.tex](abbreviations.tex) - Acronyms and abbreviations.
- [commands.tex](commands.tex) - Example LaTeX macros.

Following additional files are included, which do not need to be adapted:

- [localSettings.yaml](localSettings.yaml) - Settings for [latexindent](https://ctan.org/pkg/latexindent)
- [Makefile](Makefile) - The Makefile. Builds on latexmk.
- [Texlivefile](Texlivefile) - List of packages required for a minimal TeXLive installation.

## Background

The official template is available at <https://www.springer.com/gp/computer-science/lncs/conference-proceedings-guidelines> --> "Templates, samples files & useful links" --> "LaTeX2e Proceedings Templates (zip)"

## LaTeX compilation

Compile either in a Docker container (recommended) or with a LaTeX distribution installed on your machine.

### Docker-based (recommended)

The [TeX Live docker image by the Island of TeX](https://gitlab.com/islandoftex/images/texlive#tex-live-docker-image) works the same on Windows, macOS, and Linux.
It ships a complete TeX Live including `latexmk`, `biber`, `latexindent`, Python, and [latexminted].
Thus, `minted` works out of the box - also on Windows, without a separate Python setup.

1. Install [Docker](https://docs.docker.com/get-started/get-docker/) ([Docker Desktop](https://docs.docker.com/desktop/) on Windows and macOS).
1. Open a terminal in the directory of this document and compile in the container.
   The first run downloads the image (approx. 3 GB); its tag selects the TeX Live version of this template.

   Windows (PowerShell):

   ```powershell
   docker run --rm -v "${PWD}:/workdir" registry.gitlab.com/islandoftex/images/texlive:latest latexmk paper
   ```

   Windows (Command Prompt):

   ```cmd
   docker run --rm -v "%cd%:/workdir" registry.gitlab.com/islandoftex/images/texlive:latest latexmk paper
   ```

   Linux and macOS:

   ```shell
   docker run --rm -v "$PWD:/workdir" registry.gitlab.com/islandoftex/images/texlive:latest latexmk paper
   ```

1. Optional: Let VS Code compile in the container, see ["VS Code configuration"](#vs-code-configuration).

If you need additional tools in the image (for instance, PlantUML), extend the generated `Dockerfile`, build it with `docker build -t ltg .`, and use `ltg` instead of the image name.

### Traditional

Install a LaTeX distribution on your machine:

- Windows: Recent [MiKTeX](http://miktex.org/). MiKTeX installation hints are given at <http://latextemplates.github.io/scientific-thesis-template/#installation-hints-for-windows>.
- macOS: Recent [TeX Live](https://www.tug.org/texlive/) (e.g. through [MacTeX](https://tug.org/mactex/)) - Try `sudo tlmgr update --all` if you encounter issues with biblatex
- Linux: Recent TeX Live distribution

To have `minted` running with a traditional installation, you have to do following steps on Windows (the Docker image already contains all of this):

1. Install python: `choco install python` - that uses [chocolatey](https://chocolatey.org/) to install Python
2. Install [latexminted]: `pip install latexminted` - that uses the Python package manager to install the minted library
3. When latexing, use `-shell-escape`: `pdflatex -shell-escape paper`.
   You can also just execute `latexmk paper`.
### latexmk hints

[latexmk] runs the LaTeX tools (e.g., lualatex and bibtex) as often as needed to get the final PDF ([why `latexmk` is great](https://tex.stackexchange.com/a/249243/9075)).
It reads its configuration from `.latexmkrc` in the directory of the document.
Overleaf reads `.latexmkrc`, too, so the "Compiler" setting of the Overleaf project does not matter; select TeX Live 2026 there.
To use the configuration for all your documents, put it at [the right place](http://tex.stackexchange.com/a/41149/9075).

Build the document:

```bash
latexmk paper
```

In the Docker-based setup, put the `docker run ...` part from ["Docker-based (recommended)"](#docker-based-recommended) in front, or just run `make`.
In the traditional setup, `latexmk` needs Perl (TeX Live ships it; with MiKTeX, install it, e.g., via `choco install strawberryperl`).

To recompile on every change and open the PDF, run:

```bash
latexmk -pvc paper
```

On Windows, the configuration opens the PDF in [Sumatra PDF], which reloads the PDF automatically.

## Tool hints

### Editor and bibliography

Independent of the chosen setup:

- Grammar and spell checking is available at [TeXstudio].
  Please download [LanguageTool] (Windows: `choco install languagetool`) and [configure TeXstudio to use it](http://wiki.languagetool.org/checking-la-tex-with-languagetool#toc4).
  Note that it is enough to point to `languagetool.jar`.
  **If TeXstudio doesn't fit your need, check [the list of all available LaTeX Editors](http://tex.stackexchange.com/questions/339/latex-editors-ides).**
- Use [JabRef] to manage your bibliography (Windows: `choco install jabref`).

### Advanced usage

On the command line, there are additional features:

- `make` builds the PDF in the Docker container; `make LOCAL=1` uses your local LaTeX distribution (this works for all `make` targets)
- `latexmk -C` or `make clean` for cleaning up
- `make log` shows only the relevant messages of the last LaTeX run (using [texlogsieve](https://ctan.org/pkg/texlogsieve))
- `make format` to reformat the `.tex` files (one sentence per line and indent)
- `make aspell` for interactive spell checking
- `make stand`: Creates a new PDF with the current status of the document.
- `make view`: Opens the configured viewer
- `make mrproper`: Cleans up and removes also editor backup files.

The `textlint` job of the `Check` workflow reports weakening words (e.g., "clearly", "just") in the English `.tex` files as annotations.
Run it locally with `npx` (needs Node.js; rules come from `.textlintrc.json`):

```bash
npx --yes --package textlint --package textlint-plugin-latex2e --package textlint-filter-rule-allowlist --package textlint-rule-terminology --package textlint-rule-write-good textlint paper.tex
```

### VS Code configuration

Currently, following extensions are recommended:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) to support LaTeX in VS Code and
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) to enhance LaTeX Workshop
- [LTeX+] to have a nice spell checker that also identifies grammar issues

With the settings below, LaTeX Workshop compiles with the recipe "lualatex ➞ bibtex ➞ lualatex × 2".
To compile in the Docker container (see ["Docker-based (recommended)"](#docker-based-recommended)), add the following lines to VS Code's `settings.json` (<kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>P</kbd>, then "Preferences: Open Settings (JSON)"):

```javascript
    "latex-workshop.docker.enabled": true,
    "latex-workshop.docker.image.latex": "registry.gitlab.com/islandoftex/images/texlive:latest",
```

The following settings are additionally recommended:

```javascript
{
    "editor.wordWrap": "on",                                          // enable soft line breaks
    "latex-workshop.view.pdf.viewer": "tab",                          // display the generated PDF in a separate tab
    "latex-workshop.view.pdf.color.light.backgroundColor": "#cccccc", // light theme: use a darker background in the PDF viewer to lift the pages off it
    "latex-workshop.view.pdf.color.dark.backgroundColor": "#121314",  // dark theme: same, with a dark gray matching the editor
    "latex-workshop.latex.autoBuild.run": "never",                    // never automatically build; alternative: "onSave" (on saving .tex files)
    "editor.renderWhitespace": "all",                                 // display all whitespaces
}
```

Alternatively, just copy and paste the contents of the [vscode.settings.json](vscode.settings.json) file to your VS Code settings file.

You can manually trigger compilation by hitting the green button in the extension or using other methods provided by LaTeX Workshop.

### LTeX+ tips and tricks

[LTeX+] is an offline grammar and spell checker with support for LaTeX and Markdown.

The main file starts with a magic comment that tells LTeX+ the language of the document, e.g., `% LTeX: language=en-US`.
Add the same comment to further `.tex` files.

## Final submission

### arXiv

The first line of `paper.tex` is `\ifdefined\pdfoutput\pdfoutput=1\fi`.
Keep it when uploading to arXiv: arXiv scans the first lines for `\pdfoutput=1` to decide between `pdflatex` and DVI-producing `latex`.
Without the line, arXiv falls back to `latex`, which cannot build the modern fonts (they ship without Metafont sources) and aborts with an error such as `! I can't find file 'clmr28t10+20'`.
See [this question on TeX.SE](https://tex.stackexchange.com/q/584702/9075) for details.

## FAQs

### Q: How do I find the cause of a LaTeX error?

In case something goes wrong, you can instruct the LaTeX compiler to stop at the first error:

```bash
lualatex --synctex=1 --shell-escape paper
```

Run `bibtex paper` to get the bibliography rendered (execute `lualatex` afterwards).

### Q: How do I spell check a passage in another language?

Use the `\foreignlanguage{language}{text}` command.
LTeX+ will detect these elements and automatically switch the spell checker's language.
For example:

```latex
\foreignlanguage{english}{Therefore, our proposed approach will change the world.}
```

### Q: Overleaf outputs a warning regarding the llncs class

Overleaf might output following warning:

> LaTeX Warning: You have requested, on input line 8, version
> 2018/03/10' of document class llncs, but only version 2004/08/17 v2.14
> LaTeX document class for Lecture Notes in Computer Science'
> is available.

The reason is that you did not use `llncs.cls` (included in your LaTeX distribution).
Please remove the file and update your LaTeX distribution.

### Q: How can I synchronize updates from the template to my repository?

1. Initialize your git repository as usual
2. Add this repository as git remote: `git remote add template https://github.com/latextemplates/{template}.git`
3. Merge the branch `template/main` into your `main` branch: `git merge template/main`.

After that you can use and push the `main` branch as usual.
Notes on syncing with the upstream repository [are available from GitHub](https://help.github.com/articles/syncing-a-fork/).

### Q: I get the error `! pdfTeX error (font expansion): auto expansion is only possible with scalable fonts.`

Install the `cm-super` package using the MiKTeX package manager. Then, run `initexmf --mkmaps` on the command line. (Long description: <https://tex.stackexchange.com/a/324972/9075>)

### Q: I get `Package csquotes Error: Unbalanced groups or invalid nesting.` What can I do?

A: You have activated `\MakeOuterQuote{"}` and used some special babel command to allow hyphenation at other places as a dash. One example is writing `application"=specific`.
Now, you have to decide whether you want keep using plain quotes to enquote a word or use the special hyphenation command.
In other words: Do you want `"quote"` and `app\-lication\-specific` or `\enquote{quote} and  application"=specific`?

Note that this should not happen when the template is generated as the setting `tweakouterquote` ensures that these two options are mutually exclusive.

### Q: I need more space. What can I do?

The most simple solution to get more space is to exchange the font.

### Q: How can I reformat my `.tex` files?

Execute `latexindent -l -s -sl -w paper.tex`

Alternatively, execute `make format`.

### Q: How I want to obey the one-sentence-per-line rule. How to do?

See "How can I reformat my `.tex` files?"

### Q: I want to use minted, because I think its syntax highlighting seems to be better.

You can re-generate the template and choose `minted` as listings environment.
Moreover, ensure that python and [latexminted] are installed properly:

- `choco install python`
- `pip install latexminted`

### Q: I have troubles with minted on Windows.

For instance, on gets following output:

```text
! Package minted Error: minted v3+ executable is not installed, is not added to
 PATH, or is not permitted with restricted shell escape; or MiKTeX is being use
d with -aux-directory or -output-directory without setting a TEXMF_OUTPUT_DIREC
TORY environment variable.
```

Try out following command to update `latexminted`.
See [minted#425](https://github.com/gpoore/minted/issues/425) for details.

```shell
python3 -m pip install --force-reinstall latexminted
```

### Q: Is it possible to have a footer indicating that the paper is intended to be submitted/submitted/published?

Activate the `llncsconf` package.
The possible options are listed in `paper.tex`.

### Q: Is it possible produce a self-archiving version?

Use the [`authorarchive` package](https://ctan.org/pkg/authorarchive); `paper.tex` contains a commented example.

### Q: Can I also write in German?

Yes. You can regenerate the template and choose "German" as language.

### Q: `ngerman-x-latest` is reported missing

Install the package `dehyph-exptl`.

### Q: I get ``! I can't find file `clmr28t10+20'.``

`latexmk` runs `latex`, which produces a DVI file (and not a PDF file), because it does not find its configuration.
Make sure that `.latexmkrc` is in the directory of the document.

### Q: I get `Font "LatinModernMath-Regular" not found.`. What can I do?

Error message:

```text
luaotfload | db : Reload initiated (formats: otf,ttf,ttc); reason: Font "LatinModernMath-Regular" not found.
luaotfload | resolve : sequence of 3 lookups yielded nothing appropriate.

! Package fontspec Error: The font "LatinModernMath-Regular" cannot be found.
```

Install the package `lm-math` manually.

### Q: I get ``File `ushyphex.tex' not found.``

Install package `tugboat`.

### Q: I get `! Package fontspec Error: The font "TeXGyreTermes" cannot be found.`. What can I do?

Install the package `tex-gyre` and `tex-gyre-math` manually.

### Q: I get `! error:  (type 1): cannot find encoding file 'ntx-ot1-tlf.enc' for reading`. What can I do?

See <https://tex.stackexchange.com/a/240850/9075>: Install the packages `newpx` and `newtxsf` manually.

### Q: I get `! TeX capacity exceeded, sorry [main memory size=3000000].`. What can I do?

Follow the steps at <https://tex.stackexchange.com/a/548335/9075>

Try with following command

```bash
lualatex -shell-escape --extra-mem-top=10000000 --synctex=1 paper.tex
```

See <https://tex.stackexchange.com/a/124206/9075> for details.

### Q: There is an output that biber/biblatex too old

See installation hints of how to update them at different systems.

### Q: MiKTeX complains about missing `.sty` files.

Use the [MiKTeX console](https://miktex.org/howto/miktex-console) to refresh the package index.
Then, automatic installation should work again.

### Q: I cannot get minted to run. There is this `-shell-escape` warning.

Please ensure that your compilation command includes `-shell-escape`.
E.g., `lualatex -shell-escape -synctex=1 main-minted-german.tex`.
When compiling `main-minted-german.tex` with TeXStudio, you will see a dialog warning about overriding the compilation command.
Just answer "(a) allow for this document" and it will work.

### Q: How to include Excel charts properly?

1. Select the Excel chart you want to use.
2. Print to PDF with the option "Print Selected Chart".
3. Remove empty space of the created PDF page with `pdfcrop chart.pdf chart_cropped.pdf` (install via MikTeX first, if not available; check via `pdfcrop --version`).
4. Use [pdfscissors](https://sites.google.com/site/pdfscissors) to crop the borders and title (maybe you have to allow <https://sites.google.com> in the Java security center in the control panel).
5. Include the PDF in LaTeX via `\includegraphics{chart_cropped.pdf}`.

## Further information

- tex.stackexchange.com questions regarding LNCS: <https://tex.stackexchange.com/questions/tagged/lncs>
- Original LNCS documentation (without the improvements): [llncsdoc.pdf](https://mirrors.ctan.org/macros/latex/contrib/llncs/llncsdoc.pdf) from the [llncs CTAN package](https://ctan.org/pkg/llncs). The old `llncs.dem` demonstration is no longer part of that package; the official sample paper (`samplepaper.tex`) is contained in Springer's [LaTeX2e Proceedings Templates (zip)](https://www.springer.com/gp/computer-science/lncs/conference-proceedings-guidelines).
- Why the templates use which packages: [decision records of the template generator](https://github.com/latextemplates/generator-latex-template/tree/main/docs/decisions)
- Other templates: <https://latextemplates.github.io/>
- For German users, go to <https://texfragen.de/>.
- Frank Mittelbach with Ulrike Fischer: [The LaTeX Companion](https://www.latex-project.org/news/2023/03/17/TLC3/) is the ultimate guide for LaTeX: The authors went through all packages offered by [CTAN](https://ctan.org/), selected the most promising ones, described them, and provide minimal working example for each of it.
- Lutz Hering, Heike Hering: [How to Write Technial Reports](https://doi.org/10.1007/978-3-540-69929-3), Springer, 2010; also available in German [Technische Berichte - verständlich gliedern, gut gestalten, überzeugend vortragen](https://doi.org/10.1007/978-3-8348-8317-9). - Highly recommended, because it guides through all aspects of a report (such as a Master Thesis).
- Marcus Deininger et al.: [Studienarbeiten - Ein Leitfaden zur Erstellung, Durchführung und Präsentation wissenschaftlicher Abschlussarbeiten am Beispiel Informatik](https://vdf.ch/studienarbeiten.html?author_id=2877), vdf. - Recommended as guideline for planning and working on the whole thesis.
- Charles Lipson, [Cite Right, Second Edition: A Quick Guide to Citation Styles--MLA, APA, Chicago, the Sciences, Professions, and More](http://www.press.uchicago.edu/ucp/books/book/chicago/C/bo10702043.html), Chicago Guides to Writing, Editing, and Publishing, 2011. - Recommended in case you are unsure about how to correctly cite something.

## License

The license of this work is [0BSD](https://spdx.org/licenses/0BSD.html) which corresponds to "public domain".
Any derived work can freely be relicensed and can omit original copyright and license information.

[biber]: https://www.ctan.org/pkg/biber
[biblatex]: http://tex.stackexchange.com/tags/biblatex/info
[bibtex]: https://www.ctan.org/pkg/bibtex
[booktabs]: https://ctan.org/pkg/booktabs
[zref-clever]: https://ctan.org/pkg/zref-clever
[csquotes]: https://www.ctan.org/pkg/csquotes
[hypcap]: https://www.ctan.org/pkg/hypcap
[hyperref]: https://ctan.org/pkg/hyperref
[latexindent]: https://ctan.org/pkg/latexindent
[latexmk]: http://tex.stackexchange.com/tags/latexmk/info
[listings]: https://ctan.org/pkg/listings
[lualatex]: http://www.luatex.org/
[microtype]: https://ctan.org/pkg/microtype
[minted]: https://ctan.org/pkg/minted
[natbib]: https://ctan.org/pkg/natbib
[paralist]: https://www.ctan.org/pkg/paralist
[pdfcomment]: https://www.ctan.org/pkg/pdfcomment
[upquote]: https://www.ctan.org/pkg/upquote

[JabRef]: https://www.jabref.org
[LanguageTool]: https://languagetool.org/
[latex template generator]: https://www.npmjs.com/package/generator-latex-template
[LTeX+]: https://marketplace.visualstudio.com/items?itemName=ltex-plus.vscode-ltex-plus
[latexminted]: https://pypi.org/project/latexminted/
[Sumatra PDF]: https://www.sumatrapdfreader.org/free-pdf-reader

[llncs2e.zip]: ftp://ftp.springernature.com/cs-proceeding/llncs/llncs2e.zip

<!-- disable markdown-lint rules contradicting our writing of FAQs -->
<!-- markdownlint-disable-file MD001 MD013 MD026 -->
