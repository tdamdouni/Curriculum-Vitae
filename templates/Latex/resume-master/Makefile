all: cv.pdf

cv.pdf: cv.tex vc.tex pubs.bib pubs2.bib \
		moderncvstylecsardi.sty moderncvcolorwes.sty
	latexmk -xelatex --jobname=$(basename $@) $<

vc.tex:
	./vc
