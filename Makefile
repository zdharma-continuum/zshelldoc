NAME=zshelldoc

INSTALL?=install -c
PREFIX?=/usr/local
BIN_DIR?=$(DESTDIR)$(PREFIX)/bin
SHARE_DIR?=$(DESTDIR)$(PREFIX)/share/$(NAME)
DOC_DIR?=$(DESTDIR)$(PREFIX)/share/doc/$(NAME)

all: build/zsd build/zsd-transform build/zsd-detect build/zsd-to-adoc

build/zsd: zsd.preamble zsd.main
	mkdir -p build
	rm -f build/zsd
	cat zsd.preamble > build/zsd
	echo "" >> build/zsd
	cat zsd.main >> build/zsd
	chmod +x build/zsd

build/zsd-transform: zsd-transform.preamble zsd-transform.main zsd-process-buffer zsd-trim-indent
	mkdir -p build
	rm -f build/zsd-transform
	cat zsd-transform.preamble > build/zsd-transform
	echo "" >> build/zsd-transform
	echo "zsd-process-buffer() {" >> build/zsd-transform
	cat zsd-process-buffer >> build/zsd-transform
	echo "}" >> build/zsd-transform
	echo "" >> build/zsd-transform
	echo "zsd-trim-indent() {" >> build/zsd-transform
	cat zsd-trim-indent >> build/zsd-transform
	echo "}" >> build/zsd-transform
	echo "" >> build/zsd-transform
	cat zsd-transform.main >> build/zsd-transform
	chmod +x build/zsd-transform

build/zsd-detect: zsd-detect.preamble zsd-detect.main zsd-process-buffer
	mkdir -p build
	rm -f build/zsd-detect
	cat zsd-detect.preamble > build/zsd-detect
	echo "" >> build/zsd-detect
	echo "zsd-process-buffer() {" >> build/zsd-detect
	cat zsd-process-buffer >> build/zsd-detect
	echo "}" >> build/zsd-detect
	echo "" >> build/zsd-detect
	cat zsd-detect.main >> build/zsd-detect
	chmod +x build/zsd-detect

build/zsd-to-adoc: zsd-to-adoc.preamble zsd-to-adoc.main
	mkdir -p build
	rm -f build/zsd-to-adoc
	cat zsd-to-adoc.preamble > build/zsd-to-adoc
	echo "" >> build/zsd-to-adoc
	cat zsd-to-adoc.main >> build/zsd-to-adoc
	chmod +x build/zsd-to-adoc

install: build/zsd build/zsd-detect build/zsd-transform build/zsd-to-adoc
	$(INSTALL) -d $(SHARE_DIR)
	$(INSTALL) -d $(DOC_DIR)
	cp build/zsd build/zsd-transform build/zsd-detect build/zsd-to-adoc $(BIN_DIR)
	cp zsd.config README.md NEWS LICENSE $(DOC_DIR)

uninstall:
	rm -f $(BIN_DIR)/zsd $(BIN_DIR)/zsd-transform $(BIN_DIR)/zsd-detect $(BIN_DIR)/zsd-to-adoc
	rm -f $(DOC_DIR)/zsd.config $(DOC_DIR)/README.md $(DOC_DIR)/NEWS $(DOC_DIR)/LICENSE
	[ -d $(DOC_DIR) ] && rmdir $(DOC_DIR) || true
	rm -f $(SHARE_DIR)/*
	[ -d $(SHARE_DIR) ] && rmdir $(SHARE_DIR) || true

.PHONY: all install uninstall
