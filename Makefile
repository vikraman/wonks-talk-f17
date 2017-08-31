TEX = main.tex slides.tex
PDF = main.pdf

all: $(PDF)

$(PDF): $(TEX)
	context --nonstopmode $<

cont:
	while inotifywait $(TEX) ; do $(MAKE) ; done

clean:
	context --purgeall

distclean: clean
	rm -f *.pdf

.PHONY: cont clean
