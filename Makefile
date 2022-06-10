all: index

index: filelist
	cp template.html workdir/$(INDEX_NAME).html

filelist: filelist_raw
	cat workdir/$(INDEX_NAME).txt | perl -e 'print "window.images = [\n" . join(",\n", map { chomp; qq(  "$$_") } <STDIN>) . "\n]"' > workdir/image_list.js

filelist_raw: workdir
	find $(IMAGE_ROOT) -name \*.jpg > workdir/$(INDEX_NAME).txt

workdir:
	mkdir workdir

clean:
	rm -r workdir

