NAME=zshelldoc

INSTALL?=install -c
PREFIX?=/usr/local
BIN_DIR?=$(DESTDIR)$(PREFIX)/bin
SHARE_DIR?=$(DESTDIR)$(PREFIX)/share/$(NAME)
DOC_DIR?=$(DESTDIR)$(PREFIX)/share/doc/$(NAME)

all: zsd zsd-transform zsd-detect

zsd: zsd.preamble zsd.main
	rm -f zsd
	cat zsd.preamble > zsd
	echo "" >> zsd
	cat zsd.main >> zsd
	chmod +x zsd

zsd-transform: zsd-transform.preamble zsd-transform.main zsd-process-buffer
	rm -f zsd-transform
	cat zsd-transform.preamble > zsd-transform
	echo "" >> zsd-transform
	echo "zsd-process-buffer() {" >> zsd-transform
	cat zsd-process-buffer >> zsd-transform
	echo "}" >> zsd-transform
	echo "" >> zsd-transform
	cat zsd-transform.main >> zsd-transform
	chmod +x zsd-transform

zsd-detect: zsd-detect.preamble zsd-detect.main zsd-process-buffer
	rm -f zsd-detect
	cat zsd-detect.preamble > zsd-detect
	echo "" >> zsd-detect
	echo "zsd-process-buffer() {" >> zsd-detect
	cat zsd-process-buffer >> zsd-detect
	echo "}" >> zsd-detect
	echo "" >> zsd-detect
	cat zsd-detect.main >> zsd-detect
	chmod +x zsd-detect

install: zsd zsd-detect zsd-transform
	$(INSTALL) -d $(SHARE_DIR)
	$(INSTALL) -d $(DOC_DIR)
	cp zsd zsd-transform zsd-detect $(BIN_DIR)
	cp zsd.config README.md NEWS LICENSE $(DOC_DIR)

uninstall:
	rm -f $(BIN_DIR)/zsd $(BIN_DIR)/zsd-transform $(BIN_DIR)/zsd-detect
	rm -f $(DOC_DIR)/zsd.config $(DOC_DIR)/README.md $(DOC_DIR)/NEWS $(DOC_DIR)/LICENSE
	[ -d $(DOC_DIR) ] && rmdir $(DOC_DIR) || true
	rm -f $(SHARE_DIR)/*
	[ -d $(SHARE_DIR) ] && rmdir $(SHARE_DIR) || true

.PHONY: all install uninstall
