BIBFILE = refs.bib
PAPERS = statistical-quorum.pdf

all: $(PAPERS)

%.pdf: %.tex $(BIBFILE) acmart.* ACM-Reference-Format.* figures/*
	pdflatex -interaction=nonstopmode "$<"
	bibtex "$(<:%.tex=%.aux)"
	pdflatex -interaction=nonstopmode "$<"
	pdflatex -interaction=nonstopmode "$<"

clean:
	rm -f *.dvi *.0 *.log *.mpx *.mp *.aux *.lof *.lot *.toc *.ptb *.brf *.bbl *.blg *.out mpxerr.tex $(PAPERS)

.PHONY: all clean

.SUFFIXES: .pdf .tex .bib
