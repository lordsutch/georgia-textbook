SOURCES = metadata.yaml $(wildcard frontmatter/*.md ch*/*.md endmatter/*.md)

# Other sources that may affect output but shouldn't be passed to pandoc
OTHERS = bibliography.bib $(wildcard */*.jpg */*.svg */*.svgz)

all: textbook.pdf textbook.epub textbook.html

textbook.pdf: $(SOURCES) $(OTHERS)
	pandoc --pdf-engine=lualatex --number-sections -C --toc -o $@ $(SOURCES)

textbook.epub: $(SOURCES) $(OTHERS)
	pandoc --number-sections -C -o $@ $(SOURCES)

textbook.html: $(SOURCES) $(OTHERS)
	pandoc --section-divs --number-sections -C -s --toc --self-contained -o $@ $(SOURCES)
