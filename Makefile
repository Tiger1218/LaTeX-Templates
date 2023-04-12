LaTeX_FLAGS = -shell-escape
LATEX = xelatex $(LaTeX_FLAGS)
BIBTEX = bibtex

all: test_templates.pdf

test_templates.pdf: test_templates.tex tiger1218.sty parts/citation.bib
	${LATEX} test_templates
	${LATEX} test_templates
	$(BIBTEX) test_templates
	${LATEX} test_templates

.PHONY: clean, view
clean: 
	rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.synctex\(busy\) *.fls *.fdb_latexmk *.synctex.gz

view: test_templates.pdf
	okular test_templates.pdf
