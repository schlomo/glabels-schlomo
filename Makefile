.PHONY: all build test install clean deb
PACKAGE=glabels-schlomo
SHELL=bash

all: build

build:
	@echo No build required

release:
	git-dch --full --release --distribution stable --auto --git-author --commit

test:
	xmllint --noout templates/*

install:
	mkdir -p $(DESTDIR)/usr/share/libglabels-3.0/templates
	install -m 0644 -t $(DESTDIR)/usr/share/libglabels-3.0/templates templates/*

clean:
	rm -Rf debian/$(PACKAGE)* debian/files out/*

deb: clean
	debuild -i -us -uc -b --lintian-opts --profile debian
	mkdir -p out
	mv ../$(PACKAGE)*.{deb,build,changes} out/
	dpkg -I out/*.deb
	dpkg -c out/*.deb

repo:
	../putinrepo.sh out/*.deb

# vim: set ts=4 sw=4 tw=0 noet : 
