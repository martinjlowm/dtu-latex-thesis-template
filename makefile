LUALATEX=lualatex -shell-escape -file-line-error -interaction=nonstopmode

.PHONY: all
all: Thesis.tex
	latexmk -pdf -pdflatex="$(LUALATEX)" -use-make Thesis.tex

.PHONY: auto
auto: Thesis.tex
	latexmk -pdf -pdflatex="$(LUALATEX)" -use-make -pvc Thesis.tex

.PHONY: clean
clean:
	for f in $(shell cat .gitignore) ; do \
	  rm -f $$f ; \
	done
