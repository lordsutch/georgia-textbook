SOURCES = metadata.yaml $(wildcard */*.md)

# Other sources that may affect output but shouldn't be passed to pandoc
OTHERS = bibliography.bib $(wildcard */*.jpg */*.svg */*.svgz)

all: textbook.pdf textbook.epub textbook.html

textbook.pdf: $(SOURCES) $(OTHERS)
	pandoc -C --toc -o $@ $(SOURCES)

textbook.epub: $(SOURCES) $(OTHERS)
	pandoc -C -o $@ $(SOURCES)

textbook.html: $(SOURCES) $(OTHERS)
	pandoc -C -s --toc -o $@ $(SOURCES)
