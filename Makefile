all: test_templates.pdf

test.pdf: test_templates.tex tiger1218.sty parts/citation.bib
	xelatex test_templates
	xelatex test_templates
	bibtex test_templates
	xelatex test_templates

clean: 
	rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.synctex\(busy\) *.fls *.fdb_latexmk *.synctex.gz

view: test_templates.pdf
	okular test_templates.pdf
