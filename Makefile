SHELL = /bin/sh
prefix = /usr/local
bindir = $(prefix)/bin
datadir = $(prefix)/share
srcdir = .

VERSION = 0.1.0
bin_PROGRAMS = zsd zsd-transform zsd-detect zsd-to-adoc

all: $(bin_PROGRAMS)

zsd: src/zsd.preamble src/zsd.main
	@cat src/zsd.preamble > zsd
	@echo "" >> zsd
	@cat src/zsd.main >> zsd
	@chmod +x zsd

zsd-transform: src/zsd-transform.preamble src/zsd-transform.main src/zsd-process-buffer src/zsd-trim-indent
	@cat src/zsd-transform.preamble > zsd-transform
	@echo "" >> zsd-transform
	@echo "zsd-process-buffer() {" >> zsd-transform
	@cat src/zsd-process-buffer >> zsd-transform
	@echo "}" >> zsd-transform
	@echo "" >> zsd-transform
	@echo "zsd-trim-indent() {" >> zsd-transform
	@cat src/zsd-trim-indent >> zsd-transform
	@echo "}" >> zsd-transform
	@echo "" >> zsd-transform
	@cat src/token-types.mod >> zsd-transform
	@echo "" >> zsd-transform
	@cat src/zsd-transform.main >> zsd-transform
	@chmod +x zsd-transform

zsd-detect: src/zsd-detect.preamble src/zsd-detect.main src/zsd-process-buffer src/run-tree-convert.mod src/token-types.mod
	@cat src/zsd-detect.preamble > zsd-detect
	@echo "" >> zsd-detect
	@echo "zsd-process-buffer() {" >> zsd-detect
	@cat src/zsd-process-buffer >> zsd-detect
	@echo "}" >> zsd-detect
	@echo "" >> zsd-detect
	@cat src/run-tree-convert.mod >> zsd-detect
	@echo "" >> zsd-detect
	@cat src/token-types.mod >> zsd-detect
	@echo "" >> zsd-detect
	@cat src/zsd-detect.main >> zsd-detect
	@chmod +x zsd-detect

zsd-to-adoc: src/zsd-to-adoc.preamble src/zsd-to-adoc.main src/zsd-trim-indent
	@cat src/zsd-to-adoc.preamble > zsd-to-adoc
	@echo "" >> zsd-to-adoc
	@echo "zsd-trim-indent() {" >> zsd-to-adoc
	@cat src/zsd-trim-indent >> zsd-to-adoc
	@echo "}" >> zsd-to-adoc
	@echo "" >> zsd-to-adoc
	@cat src/zsd-to-adoc.main >> zsd-to-adoc
	@chmod +x zsd-to-adoc

clean:
	rm -f $(bin_PROGRAMS)

test:
	$(MAKE) -C test test

install:
	mkdir -p $(bindir) $(datadir)/zshelldoc
	cp $(bin_PROGRAMS) $(bindir)
	cp zsd.config $(datadir)/zshelldoc/

uninstall:
	@list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
		files=`for p in $$list; do echo "$$p"; done`; \
		test -n "$$list" || exit 0; \
		echo " ( cd '$(bindir)' && rm -f" $$files ")"; \
		cd "$(bindir)" && rm -f $$files
	rm -rf $(datadir)/zshelldoc

.PHONY: all install uninstall test clean
.NOEXPORT:
