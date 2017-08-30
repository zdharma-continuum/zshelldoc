NAME=zshelldoc

INSTALL?=install -c
PREFIX?=/usr/local
BIN_DIR?=$(DESTDIR)$(PREFIX)/bin
SHARE_DIR?=$(DESTDIR)$(PREFIX)/share/$(NAME)
DOC_DIR?=$(DESTDIR)$(PREFIX)/share/doc/$(NAME)

all:

install: zsd-detect zsd-transform
	$(INSTALL) -d $(SHARE_DIR)
	$(INSTALL) -d $(DOC_DIR)
	cp zsd-detect zsd-transform $(BIN_DIR)
	cp README.md NEWS LICENSE $(DOC_DIR)

uninstall:
	rm -f $(BIN_DIR)/zsd-detect $(BIN_DIR)/zsd-transform
	rm -f $(DOC_DIR)/README.md $(DOC_DIR)/NEWS $(DOC_DIR)/LICENSE
	[ -d $(DOC_DIR) ] && rmdir $(DOC_DIR) || true
	rm -f $(SHARE_DIR)/*
	[ -d $(SHARE_DIR) ] && rmdir $(SHARE_DIR) || true

.PHONY: all install uninstall
