SCRIPT=$(wildcard plugin/*.vim)
DOC=$(wildcard doc/*.txt)
AUTOL=$(wildcard autoload/*.vim)
PLUGIN=$(shell basename "$$PWD")
VERSION=$(shell sed -n '/Version:/{s/^.*\(\S\.\S\+\)$$/\1/;p}' $(SCRIPT))

.PHONY: $(PLUGIN).vmb

all: uninstall vimball install

vimball: $(PLUGIN).vmb

clean:
	find . -type f \( -name "*.vba" -o -name "*.orig" -o -name "*.~*" \
	-o -name ".VimballRecord" -o -name ".*.un~" -o -name "*.sw*" -o \
	-name tags -o -name "*.vmb" \) -delete

dist-clean: clean

install:
	vim -N -i NONE -u NONE -c 'ru! plugin/vimballPlugin.vim' -c':so %' -c':q!' $(PLUGIN)-$(VERSION).vmb

uninstall:
	vim -N -i NONE -u NONE -c 'ru! plugin/vimballPlugin.vim' -c':RmVimball' -c':q!' $(PLUGIN)-$(VERSION).vmb

undo:
	for i in */*.orig; do mv -f "$$i" "$${i%.*}"; done

$(PLUGIN).vmb:
	rm -f $(PLUGIN)-$(VERSION).vmb
	vim -i NONE -N -u NONE -c 'ru! plugin/vimballPlugin.vim' -c ':call append("0", [ "$(SCRIPT)", "$(DOC)", "$(AUTOL)"])' -c '$$d' -c ":%MkVimball $(PLUGIN)-$(VERSION)  ." -c':q!'
	ln -f $(PLUGIN)-$(VERSION).vmb $(PLUGIN).vmb
     
release: version all

version:
	perl -i.orig -pne 'if (/Version:/) {s/\.(\d*)/sprintf(".%d", 1+$$1)/e}' ${SCRIPT} ${AUTOL}
	perl -i -pne 'if (/GetLatestVimScripts:/) {s/(\d+)\s+:AutoInstall:/sprintf("%d :AutoInstall:", 1+$$1)/e}' ${SCRIPT} ${AUTOL}
	perl -i -pne 'if (/Last Change:/) {s/(:\s+).*\n/sprintf(": %s", `date -R`)/e}' ${SCRIPT} ${AUTOL}
	perl -i.orig -pne 'if (/Version:/) {s/\.(\d+).*\n/sprintf(".%d %s", 1+$$1, `date -R`)/e}' ${DOC}
	VERSION=$(shell sed -n '/Version:/{s/^.*\(\S\.\S\+\)$$/\1/;p}' $(SCRIPT))
