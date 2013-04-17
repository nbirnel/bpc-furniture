all :: html thumbs

html :: index.html

index.html :: furniture.csv csv2htm-tbl
	./csv2htm-tbl furniture.csv >$@

thumbs ::
	mkdir -p thumbs
	rm -fv thumbs/*
	cp -v photos/* thumbs/
	cd thumbs/ && \
	gm mogrify -size 60x60 *jpg -resize 60x60 +profile "*" 

.PHONY :: all thumbs html
