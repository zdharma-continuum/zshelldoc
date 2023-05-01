SHELL = bash
.ONESHELL:
MAKEFLAGS += --silent
NAME=zshelldoc

INSTALL?=install -c
PREFIX?=/usr/local
BIN_DIR?=$(DESTDIR)$(PREFIX)/bin
DOC_DIR?=$(DESTDIR)$(PREFIX)/share/doc/$(NAME)
SHARE_DIR?=$(DESTDIR)$(PREFIX)/share/$(NAME)

all: build/zsd build/zsd-transform build/zsd-detect build/zsd-to-adoc

build/zsd: src/zsd.preamble src/zsd.main
	mkdir -p build
	cat /dev/null > build/zsd
	echo '#!/usr/bin/env zsh' >> build/zsd
	cat src/zsd.preamble | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd
	cat src/zsd.main | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd
	chmod +x build/zsd
	$(info generated zsd)

build/zsd-transform: src/zsd-transform.preamble src/zsd-transform.main src/zsd-process-buffer src/zsd-trim-indent
	mkdir -p build
	cat /dev/null > build/zsd-transform
	echo "#!/usr/bin/env zsh" >> build/zsd-transform
	cat src/zsd-transform.preamble| grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-transform
	echo "zsd-process-buffer() {" >> build/zsd-transform
	cat src/zsd-process-buffer | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-transform
	echo -e "}\nzsd-trim-indent() {" >> build/zsd-transform
	cat src/zsd-trim-indent | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-transform
	echo "}" >> build/zsd-transform
	cat src/token-types.mod | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-transform
	cat src/zsd-transform.main | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-transform
	chmod +x build/zsd-transform
	$(info generated zsd-transform)

build/zsd-detect: src/zsd-detect.preamble src/zsd-detect.main src/zsd-process-buffer src/run-tree-convert.mod src/token-types.mod
	mkdir -p build
	cat /dev/null > build/zsd-detect
	echo "#!/usr/bin/env zsh" >> build/zsd-detect
	cat src/zsd-detect.preamble | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-detect
	echo "zsd-process-buffer() {" >> build/zsd-detect
	cat src/zsd-process-buffer | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-detect
	echo "}" >> build/zsd-detect
	cat src/run-tree-convert.mod | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-detect
	cat src/token-types.mod | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-detect
	cat src/zsd-detect.main | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-detect
	chmod +x build/zsd-detect
	$(info generated zsd-detect)

build/zsd-to-adoc: src/zsd-to-adoc.preamble src/zsd-to-adoc.main src/zsd-trim-indent
	mkdir -p build
	cat /dev/null > build/zsd-to-adoc
	echo "#!/usr/bin/env zsh" >> build/zsd-to-adoc
	cat src/zsd-to-adoc.preamble | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-to-adoc
	echo "zsd-trim-indent() {" >> build/zsd-to-adoc
	cat src/zsd-trim-indent | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-to-adoc
	echo "}" >> build/zsd-to-adoc
	cat src/zsd-to-adoc.main | grep -v -E '^(\s*#.*[^"]|\s*)$$' >> build/zsd-to-adoc
	chmod +x build/zsd-to-adoc
	$(info generated zsd-to-adoc)

install: build/zsd build/zsd-detect build/zsd-transform build/zsd-to-adoc
	$(INSTALL) -d $(SHARE_DIR)
	$(INSTALL) -d $(DOC_DIR)
	$(INSTALL) -d $(BIN_DIR)
	cp build/zsd build/zsd-transform build/zsd-detect build/zsd-to-adoc $(BIN_DIR)
	cp zsd.config $(SHARE_DIR)
	$(info zshelldoc installed in $(BIN_DIR))

uninstall:
	rm -f $(BIN_DIR)/zsd $(BIN_DIR)/zsd-transform $(BIN_DIR)/zsd-detect $(BIN_DIR)/zsd-to-adoc
	rm -f $(SHARE_DIR)/zsd.config $(DOC_DIR)/README.md $(DOC_DIR)/NEWS $(DOC_DIR)/LICENSE
	[ -d $(DOC_DIR) ] && rmdir $(DOC_DIR) || true
	[ -d $(SHARE_DIR) ] && rmdir $(SHARE_DIR) || true

clean:
	rm -rf build/*
	$(info cleaned zshelldoc artifacts)

test:
	make -C test test

.PHONY: all install uninstall test clean

# vim: set expandtab filetype=make shiftwidth=4 softtabstop=4 tabstop=4:
