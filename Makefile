.PHONY: all
TIMESTAMP = $(shell date +%Y%m%d%H%M)

all: pdf preprint clean

pdf: addtimestamp compilepdf

preprint: addtimestamp compilepreprint

compilepdf: main.tex
	latexmk -pdf -recorder -pdflatex="pdflatex -interaction=nonstopmode -synctex=1" -use-make -bibtex main.tex

compilepreprint: main-preprint.tex
	latexmk -pdf -recorder -pdflatex="pdflatex -interaction=nonstopmode -synctex=1" -use-make -bibtex main-preprint.tex

addtimestamp: common-conf.tex
	for i in "unsure" "change" "updated" "tocite" "commentAnkursinha" "commentBlackfile" "commentLbazan" "commentZbyszek" "commentGicmo" "commentSergiopr" "commentTerezahl" "commentMhough" "commentIgnatenkobrain" "commentIlgrad"; do \
		sed -i "s/\($$i{\)\([[:alnum:]].*}\)/\1-$(TIMESTAMP)- \2/" *.tex ; \
	done

clean:
	rm -fv *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc *.dvi *.vrb *.bcf *.run.xml *.cut *.lo* *.ttt *.fff *.suppinfo *.tdo
	latexmk -c

