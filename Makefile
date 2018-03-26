
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

.PHONY: publish
publish: all
	git branch -D gh-pages || :
	git checkout --orphan gh-pages
	git reset
	git add -f *.html
	git commit -m .
	git push -f origin gh-pages
	git clean -xdf
	git checkout master
