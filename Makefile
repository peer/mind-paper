DOCUMENT = paper.pdf
TEXFILE = $(DOCUMENT:%.pdf=%.tex)
BIBFILE = refs.bib

all: $(DOCUMENT)

$(DOCUMENT): $(TEXFILE) $(BIBFILE) sigchi.cls sigchi.bst
	pdflatex -interaction=nonstopmode "$<"
	bibtex "$(<:%.tex=%.aux)"
	pdflatex -interaction=nonstopmode "$<"
	pdflatex -interaction=nonstopmode "$<"

clean:
	rm -f *.dvi *.0 *.log *.mpx *.mp *.aux *.lof *.lot *.toc paper.pdf *.ptb *.brf *.bbl *.blg *.out mpxerr.tex

.PHONY: all clean

.SUFFIXES: .pdf .tex .bib
