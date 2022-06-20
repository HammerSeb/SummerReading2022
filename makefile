.PHONY: main.pdf all clean clean-all

all:main.pdf

main.pdf: main.tex
	 latexmk -pdf -shell-escape -file-line-error -f -pdflatex="pdflatex -interaction=nonstopmode --shell-escape %O %S" main.tex

clean:
	latexmk -c
	$(RM) -f main.auxlock
	$(RM) -f main.loa
	$(RM) -f main.unq
	$(RM) -f main.run.xml

clean-all: clean
	$(RM) -f main.bbl

clean-purge: clean-all
	latexmk -C
