# Enhanced LNCS Template

> Quick start for modern LaTeXing with [LNCS](http://www.springer.com/computer/lncs).

## Usage

- `paper.tex` is the main document
- Use "lualatex + bibtex" in your TeX editor or `latexmk paper` / `make` in the command line

### Using `latexmk`

[latexmk] is a very smart tool for latex compilation.
It executes the latex tools as often as needed to get the final PDF.
(More information about why `latexmk` is great can be found at <https://tex.stackexchange.com/a/249243/9075>.)

To build the whole document, execute following command.
Note that this requires a working perl installation.

```bash
latexmk paper
```

To enable latexmk, please move `_latexmkrc` to `latexmkrc`.

If you want automatic compilation use following command:

```bash
latexmk -pvc paper
```

This will also open a [Sumatra PDF] and only works with the supplied configuration.

#### latexmk configuration

This repository ships a `.latexmkrc` which is read by latexmk.
In case there is a `_latexmkrc` file, you need to rename it to `.latexmkrc`.
It is configured for Windows and especially sets Sumatra PDF as default PDF viewer.
You can make this local configuration a global configuration, when you put it at [the right place](http://tex.stackexchange.com/a/41149/9075).

If you want to add more packages, configure it there.
For instance, for support of makeglossaries see <http://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries>.

### Debugging LaTeX errors

In case something goes wrong, you can instruct the LaTeX compiler to stop at the first error:

```bash
lualatex --synctex=1 --shell-escape paper
```

Run `bibtex paper` to get the bibliography rendered (execute `lualatex` afterwards).

### Advanced usage

On the command line, there are additional features:

- `latexmk -C` or `make clean` for cleaning up
- `make format` to reformat the `.tex` files (one sentence per line and indent)
- `make aspell` for interactive spell checking
- `make stand`: Creates a new PDF with the current status of the thesis.
- `make view`: Opens the configured viewer
- `make mrproper`: Cleans up and removes also editor backup files.

## Benefits

Following features are enabled in this template:

- Provides a skeletal [paper.tex](paper.tex) file
- Example to have an image being placed right to a text
- Support for German documents (without broken headers):
  Contains a fix to increase compatibility with Babel.
  See <https://tex.stackexchange.com/a/441701/9075> for details.
- Automatic setting of "Fig." and "Section"/"Sect." according to the LNCS style.
  Just use `\Cref{sec:xy}` at the beginning of a sentence and `\cref{sec:xy}` in the middle of a sentence.
  Thanx to [cleveref].
- Sharper font (still compatible with Springer's requirements).
- (Optional) Typesetting of listings using advanced highlighting powered by the [minted] package.
  `minted` provides better output than [listings], but requires [pygments] to be installed.
- Generated PDF allows for copy and paste of text without getting words with [ligatures](https://en.wikipedia.org/wiki/Typographic_ligature) such as "workflow" destroyed.
  This is enabled by `glyphtounicode`, which encodes ligatures (such as fl) using unicode characters.
- Ligatures are removed if they are typeset at the wrong place.
  This is enabled by the [selnolig](https://tex.meta.stackexchange.com/questions/2884/new-package-selnolig-that-automates-suppression-of-typographic-ligatures) package.
- Support of hyperlinked references without extra color thanx to [hyperref].
- Better breaking of long URLs.
- Support for `\powerset` command.
- (Optional) Support todos as pdf annotations. This is enabled by the [pdfcomment] package.
- [microtypographic extensions](https://www.ctan.org/pkg/microtype) for a better look of the paper.
- Modern packages such as [microtype], [cleveref], [csquotes], [hyperref], [hypcap], [upquote], [natbib], [booktabs].
- (Optional) LaTeX compilation using the modern [lualatex] compiler.
  For older systems, [pdflatex](https://en.wikipedia.org/wiki/PdfTeX) is still supported.
- [latexmk] for easy compilation of the LaTeX document.
- Ready-to-go configuration for [latexindent].
- Proper hyphenation and microtype for English texts.

## Disabled features

Following features were not activated for this template.
You can run the [latex template generator] to enable the features.

Hints on writing an abstract and thesis by Dirk Fahland.

There is currently no official biblatex support.
A first step towards that is done at [biblatex-lncs](https://ctan.org/pkg/biblatex-lncs).

## Examples

- [paper.pdf](https://latextemplates.github.io/lncs-enhanced/paper.pdf) - normal paper.
- [paper-minted.pdf](https://latextemplates.github.io/lncs-enhanced/paper-minted.pdf) - paper showing minted in action.
- [paper-newtx.pdf](http://latextemplates.github.io/lncs-enhanced/paper-newtx.pdf) - paper typeset in Times Roman to save some space.
- [paper-minted-newtx.pdf](http://latextemplates.github.io/lncs-enhanced/paper-minted-newtx.pdf) - paper typeset in Times Roman to save some space.

## Background

The official template is available at <https://www.springer.com/gp/computer-science/lncs/conference-proceedings-guidelines> --> "Templates, samples files & useful links" --> "LaTeX2e Proceedings Templates (zip)"

## Quick start

- Click on `Download ZIP` or [here](https://github.com/latextemplates/lncs-enhanced/archive/main.zip).
- Extract `LNCS-main.zip` in the folder where you want to write your paper.
- Edit [paper.tex](paper.tex).
- `latexmk paper`.

When using on overleaf, you have to switch Overleaf to use TeXLive 2024 (or later).

As you see on GitHub actions, the paper compiles out of the box.
There is no need to adjust the packages or to remove some of them.
This might lead to undesired results such as hyperlinks not working any more or no good microtypographic features.
In case you think, a package needs to be altered or added, feel free to open an issue.

## Tool hints

### Prerequisites

- Windows: Recent [MiKTeX](http://miktex.org/). MiKTeX installation hints are given at <http://latextemplates.github.io/scientific-thesis-template/#installation-hints-for-windows>.
- Mac OS X: Recent [TeX Live](https://www.tug.org/texlive/) (e.g. through [MacTeX](https://tug.org/mactex/)) - Try `sudo tlmgr update --all` if you encounter issues with biblatex
- Linux: Recent TeX Live distribution
- Grammar and spell checking is available at [TeXstudio].
  Please download [LanguageTool] (Windows: `choco install languagetool`) and [configure TeXstudio to use it](http://wiki.languagetool.org/checking-la-tex-with-languagetool#toc4).
  Note that it is enough to point to `languagetool.jar`.
  **If TeXstudio doesn't fit your need, check [the list of all available LaTeX Editors](http://tex.stackexchange.com/questions/339/latex-editors-ides).**
- Use [JabRef] to manage your bibliography (Windows: `choco install jabref`).

### Usage of `minted`

To have minted running properly, you have to do following steps on Windows:

1. Install python: `choco install python` - that uses [chocolatey](https://chocolatey.org/) to install Python
2. Install [pygments]: `pip instal pygments` - that uses the Pyhton package manager to install the pygments library
3. When latexing, use `-shell-escape`: `pdflatex -shell-escape paper`.
   You can also just execute `latexmk paper`.

### VSCode configuration

Currently, following extensions are recommended:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) to support LaTeX in VSCode and
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) to enhance LaTeX Workshop
- [LTeX+] to have a nice spell checker that also identifies grammar issues

Then, change the setting of LaTeX Workshop to use biber:

Press <kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>P</kbd> to open the command palette.
Then type "JSON" and select "Preferences: Open Settings (JSON)" to open `settings.json`.

Update the following lines in VSCode's `settings.json` to contain:

```javascript
    "latex-workshop.latex.recipes": [
        {
            "name": "lualatex ➞ bibtex ➞ lualatex × 2 🔃",
            "tools": [
                "lualatex",
                "bibtex",
                "lualatex",
                "lualatex"
            ]
        },
    ],
    "latex-workshop.latex.tools": [
        // ...
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%DOCFILE%"
            ],
            "env": {}
        },
        // ...
    ],
```

The following settings are additionally recommended:

```javascript
{
    "editor.wordWrap": "on",                              // enable soft line breaks
    "latex-workshop.view.pdf.viewer": "tab",              // display the generaded PDF in a separate tab
    "latex-workshop.view.pdf.backgroundColor": "#cccccc", // use a darker background in de PDF viewer to lift of the pages from it
    "latex-workshop.latex.autoBuild.run": "never",        // never automatically build; alternative: "onSave" (on saving .tex files)
    "editor.renderWhitespace": "all",                     // display all whitespaces
}
```

Alternatively, just copy and paste the contents of the [vscode.settings.json](vscode.settings.json) file to your VSCode settings file.

You can manually trigger compilation by hitting the green button in the extension or using other methods provided by LaTeX Workshop.

Please remove the magic comments (`% !TeX program ...`) at the top of the `main-....tex` file.
Although [LaTeX-Workshop supports magic comments](https://github.com/James-Yu/LaTeX-Workshop/blob/master/README.md#magic-comments), it currently does not work reliably.
Without the magic comments, compilation works.

### LTeX+ tips and tricks

[LTeX+] is an offline grammar and spell checker with support for LaTeX and Markdown.

Add a magic comment to your files to tell LTeX+ which language to use:

```latex
% LTeX: language=de-DE
```

If you want to use different languages in the text, use the `\foreignlanguage{language}{text}` command.
LTeX+ will detect these elements and automatically switch the spell checker's language.
For example:

```latex
\foreignlanguage{english}{Therefore, our proposed approach will change the world.}
```

## Usage with docker

The generated `Dockerfile` is based on the [Dockerfile by the Island of TeX](https://gitlab.com/islandoftex/images/texlive#tex-live-docker-image).

```cmd
docker run --rm -v "c:\users\example\latex-document:/workdir" ltg latexmk
```

Following one-time setup is required:

```cmd
docker build -t ltg .
```

## Contained Directories and Files

### Directories

- [figures](graphics/) Directory containing the figures.
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

## FAQs

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
Moreover, ensure that python and [pygments](https://pygments.org/) are installed properly:

- `choco install python`
- `pip install pygments`

### Q: I have troubles with minted on Windows.

Try out following command to update `latexminted`.
See [minted#425](https://github.com/gpoore/minted/issues/425) for details.

```shell
py -m pip install --force-reinstall latexminted
```

### Q: Is it possible to have a footer indicating that the paper is intended to be submitted/submitted/published?

Activate the `llncsconf` package.
The possible options are listed in `paper.tex`.

### Q: Can I also write in German?

Yes. You can regenerate the template and choose "German" as language.

### Q: `ngerman-x-latest` is reported missing

Install the package `dehyph-exptl`.

### Q: I get ``! I can't find file `clmr28t10+20'.``

You seem to use `latexmk` locally.
Please move `_latexmkrc` to `latexmkrc` to get `latexmk` working.
If you don't do this, `latexmk` tries to execute `latex`, which tries to produce a DVI file (and not a PDF file).

### Q: I get `Font "LatinModernMath-Regular" not found.`. What can I do?

Error message:

```text
luaotfload | db : Reload initiated (formats: otf,ttf,ttc); reason: Font "LatinModernMath-Regular" not found.
luaotfload | resolve : sequence of 3 lookups yielded nothing appropriate.

! Package fontspec Error: The font "LatinModernMath-Regular" cannot be found.
```

Install the package `lm-math` manually.

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
- Original LNCS demonstration (without the improvements): [llncs-dem.pdf](llncs-dem.pdf)
- Original LNCS documentation (without the improvements): [llncs-doc.pdf](llncs-doc.pdf)
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
[cleveref]: https://ctan.org/pkg/cleveref
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
[pygments]: https://pygments.org/
[Sumatra PDF]: https://www.sumatrapdfreader.org/free-pdf-reader

[llncs2e.zip]: ftp://ftp.springernature.com/cs-proceeding/llncs/llncs2e.zip

<!-- disable markdown-lint rules contradicting our writing of FAQs -->
<!-- markdownlint-disable-file MD001 MD013 MD026 -->
