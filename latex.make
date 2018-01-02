L=pdflatex

LATEX=$(wildcard *.tex)
PDF=$(LATEX:.tex=.pdf)
BIBTEX=$(wildcard *.bib)

all: $(PDF)

%.pdf: %.tex $(BIBTEX)
	pdflatex $<
	- bibtex $*
	pdflatex $<
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done

clean:
	$(RM) *.aux *.bbl *.blg *.log