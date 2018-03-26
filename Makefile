
.PHONY: all
all: 2018.html index.html

PANDOCOPTS = --template template/template.html \
	--css template/template.css \
	--self-contained --toc --toc-depth 2

%.html: %.mkd
	pandoc $< -o $@ $(PANDOCOPTS)

.PHONY: clean
clean:
	rm -f *.html
