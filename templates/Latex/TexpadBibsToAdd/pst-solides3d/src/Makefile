
# `Makefile' for `pst-3dplot.pdf', hv, 2007/03/17

.SUFFIXES : .tex .ltx .dvi .ps .pdf .eps

PACKAGE = pst-solides3d

MAIN = $(PACKAGE)-doc

TDS = ~/Links/PSTricks-TDS

LATEX = latex

ARCHNAME = $(MAIN)-$(shell date +%y%m%d)

ARCHFILES = $(PACKAGE).sty $(PACKAGE).tex $(PACKAGE).pro $(MAIN).tex README Changes Makefile

all : doc clean tds
doc: $(MAIN).pdf

$(MAIN).pdf : $(MAIN).ps
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dAutoRotatePages=/All -sOutputFile=$(MAIN).pdf -dNoSAFER -c .setpdfwrite -f $(MAIN).ps
#	GS_OPTIONS="-dAutoRotatePages=/None -dNoSAFER" ps2pdf $<
	mv $(MAIN).pdf ..

$(MAIN).ps : $(MAIN).dvi
	dvips $<

$(MAIN).dvi : $(MAIN).tex
	$(LATEX) $<
	$(LATEX) $<
	if ! test -f $(basename $<).glo ; then touch $(basename $<).glo; fi
	if ! test -f $(basename $<).idx ; then touch $(basename $<).idx; fi
	makeindex -t $(basename $<).ilg -s pst-doc.ist -o $(basename $<).ind $(basename $<).idx
	makeindex -s gglo.ist -t $(basename $<).glg -o $(basename $<).gls \
	  $(basename $<).glo
	bibtex $(basename $<)
	$(LATEX) $<

clean : 
	$(RM) $(addprefix $(MAIN), .log .aux .glg .glo .gls .ilg .idx .ind .tmp .toc .out .blg .Roessler .bbl )
	$(RM) $(addprefix $(MAIN), .dvi .ps .xcp .brf)
	$(RM) data3d.Roessler

veryclean : clean
	$(RM) $(addprefix $(MAIN), .pdf .bbl .blg)

arch :
	zip $(ARCHNAME).zip $(ARCHFILES)

tds:
	cp -u ../Changes     $(TDS)/doc/generic/$(PACKAGE)/
	cp -u ../README      $(TDS)/doc/generic/$(PACKAGE)/
	cp -u ../$(MAIN).pdf $(TDS)/doc/generic/$(PACKAGE)/
#
	cp -u ../Changes        $(TDS)/tex/latex/$(PACKAGE)/
	cp -u ../$(PACKAGE).sty $(TDS)/tex/latex/$(PACKAGE)/
#
	cp -u ../Changes        $(TDS)/tex/generic/$(PACKAGE)/
	cp -u ../$(PACKAGE).tex $(TDS)/tex/generic/$(PACKAGE)/
#
	cp -u ../Changes        $(TDS)/dvips/$(PACKAGE)/
	cp -u ../$(PACKAGE).pro $(TDS)/dvips/$(PACKAGE)/
	cp -u ../$(PACKAGE).pro ~/Links/dvips-local/
#
	cp -u ../Changes     $(TDS)/source/$(PACKAGE)/
	cp -u $(MAIN).tex $(TDS)/source/$(PACKAGE)/
	cp -u $(MAIN).bib $(TDS)/source/$(PACKAGE)/
	cp -u Makefile    $(TDS)/source/$(PACKAGE)/


# EOF
