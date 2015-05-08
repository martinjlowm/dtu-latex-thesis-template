# Uncomment the compiler you wish to use.
# LATEX := pdflatex
# LATEX := lualatex
LATEX := xelatex

LATEX += -shell-escape -file-line-error -interaction=nonstopmode

define make_cmd
    latexmk -pdf -pdflatex="$(LATEX)" -use-make $1 Thesis.tex
endef

.PHONY: all
all: Thesis.tex
	$(call make_cmd)

.PHONY: auto
auto: Thesis.tex
	$(call make_cmd, -pvc)

.PHONY: clean
clean:
	for f in $(shell cat .gitignore) ; do \
	  rm -f $$f ; \
	done
